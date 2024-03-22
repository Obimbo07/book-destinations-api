class Api::V1::DestinationsController  < ApplicationController
    before_action :authenticate_user! 
    def index
        @destinations = Destination.all
        render json: @destinations
    end

    def show
        @destination = Destination.find(params[:id])
        render json: @destination
        rescue ActiveRecord::RecordNotFound
            render json: { status: 404, message: "Destination not found" }, status: :not_found
    end

    def create
    @destination = Destination.new(destination_params)

    # Handle image upload
    if params[:image_url].present? && params[:image_url].respond_to?(:read)
      # Read the uploaded file and convert it to base64
      image_data = Base64.strict_encode64(params[:image_url].read)
      # Assign the base64 encoded image data to the image_url attribute
      @destination.image_url = "data:image/#{params[:image_url].content_type.split('/').last};base64,#{image_data}"
    end

    if @destination.save
      render json: @destination, status: :created
    else
      render json: { errors: @destination.errors.full_messages }, status: :unprocessable_entity
    end
  end

def destroy
    @destination = Destination.find(params[:id])
    @destination.reservations.destroy_all
    if @destination.destroy
      render json: { status: 200, message: "Successfully deleted." }
    else
      render json: { errors: @destination.errors.full_messages }, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotFound
    render json: { status: 404, message: "Destination not found" }, status: :not_found
  end

  private

  def destination_params
    params.permit(:name, :description, :image_url, :price_per_night, :price_per_meal)
  end

end