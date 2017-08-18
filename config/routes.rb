Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: 'users/sessions'}

  namespace :api do
    namespace :v1 do
      resource :bmi, only: [:show]
    end
  end
end
