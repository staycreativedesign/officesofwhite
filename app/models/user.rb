class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :suffix
  validates_presence_of :phone_number
  validates_presence_of :client_social_security
  validates_presence_of :client_driver_license
  validates_presence_of :client_dob
  validates_presence_of :client_registration_ip
end

