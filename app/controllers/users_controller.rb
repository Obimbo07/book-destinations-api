class UsersController < ApplicationController
    before_action :authenticate_user!
    def index
        render json: { status: "ok" }
    end
end
