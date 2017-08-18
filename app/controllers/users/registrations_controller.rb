class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    user = User.new(params.require(:user).permit(:email, :password, :password_confirmation))
    if user.save
      render json: user.as_json(auth_token: user.authentication_token, email: user.email), status: 200
      return
    else
      warden.custom_failure!
      render json: {error: user.errors.full_messages.to_sentence}, status: 422
    end
  end
end
