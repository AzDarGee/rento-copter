class User < ActiveRecord::Base
  has_many :visitations
  # attr_accessor :password, :password_confirmation --> in the background
  # authenticate in the background as well with the method has_secure_password

  has_secure_password

end
