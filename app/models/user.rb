class User < ActiveRecord::Base
  has_secure_password
  has_many :documents
  before_validation :set_phone_numbers_and_ssn
  attr_accessor :phone_number_1, :phone_number_2, :phone_number_3,
                :other_phone_number_1, :other_phone_number_2,
                :other_phone_number_3, :ss_1, :ss_2, :ss_3, :employment_phone_1, :employment_phone_2, :employment_phone_3
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :suffix
  validates_presence_of :phone_number
  validates_presence_of :social_security
  validates_presence_of :driver_license
  validates_presence_of :dob
  validates_presence_of :registration_ip
  validates_presence_of :home_address
  validates_presence_of :residence_type
  validates_presence_of :household_payment
  validates_presence_of :state
  validates_presence_of :city
  validates_presence_of :zipcode
  validates_presence_of :time_at_address_months
  validates_presence_of :time_at_address_years
  validates_presence_of :employer_name
  validates_presence_of :occupation
  validates_presence_of :employment_address
  validates_presence_of :employment_city
  validates_presence_of :employment_state
  validates_presence_of :employment_zipcode
  validates_presence_of :employment_phone
  validates_presence_of :employment_gross_income
  validates_presence_of :employment_years
  validates_presence_of :employment_months
  validates :approved, inclusion: { in: [true, false] }
  validates :admin, inclusion: { in: [true, false]  }

  def set_phone_numbers_and_ssn
    #definitely refactor this to be a lot less ugly
    self.phone_number = join_numbers(phone_number_1, phone_number_2, phone_number_3)
    self.other_number = join_numbers(other_phone_number_1, other_phone_number_2, other_phone_number_3)
    self.employment_phone = join_numbers(employment_phone_1, employment_phone_2, employment_phone_3)
    self.social_security = join_numbers(ss_1, ss_2, ss_3)
  end

  def join_numbers( num1, num2, num3)
    "#{num1}#{num2}#{num3}"
  end
end

