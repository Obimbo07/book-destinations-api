class Users::RegistrationsController < Devise::RegistrationsController
  include RackSessionsFix
  before_action :configure_sign_up_params, only: [:create]
  respond_to :json

  def respond_with(resource, _opts = {})
  if request.method == "POST" && resource.persisted?
    render json: {
      status: {code: 200, message: "Signed up sucessfully."},
      data: UserSerializer.new(resource).serializable_hash[:data][:attributes]
    }, status: :ok
  elsif request.method == "DELETE"
    render json: {
      status: { code: 200, message: "Account deleted successfully."}
    }, status: :ok
  else
    render json: {
      status: {code: 422, message: "User couldn't be created successfully. #{resource.errors.full_messages.to_sentence}"}
    }, status: :unprocessable_entity
  end
end

protected 

def configure_sign_up_params
  devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
end
end
