class User < ApplicationRecord
  acts_as_token_authenticatable
  devise :database_authenticatable, :trackable, :validatable, :registerable

end
