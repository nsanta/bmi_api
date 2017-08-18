class Users::SessionsController < Devise::SessionsController
  def create
    self.resource = warden.authenticate(scope: :user)
    if resource.present?
      sign_in(:user, resource)
      respond_with_authentication_token(resource)
    else
      render json: { error: 'Invalid email or password.' }, status: :bad_request
    end
  end

  protected

  def respond_with_authentication_token(resource)
    render json: {
      auth_token: resource.authentication_token,
      email: resource.email,
      name: resource.name
    }
  end
end
