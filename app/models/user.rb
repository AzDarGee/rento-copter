class User < ActiveRecord::Base
  has_many :visitations

  # attr_accessor :password, :password_confirmation --> in the background
  # authenticate in the background as well with the method has_secure_password
  has_secure_password


  #Validations - before submitting into the database
  validates :username, :email, :presence => true
  validates :email, :uniqueness => true
end
