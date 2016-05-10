class User < ActiveRecord::Base
  attr_accessor :phone_number_1, :phone_number_2, :phone_number_3, :other_phone_number_1, :other_phone_number_2, :other_phone_number_3, :ss_1, :ss_2, :ss_3, :employment_phone_1, :employment_phone_2, :employment_phone_3
  include Documents

  before_validation :set_phone_numbers_and_ssn, on: :create
  has_many :receipts
  has_secure_password

  delegate :is_approved, to: :letter_of_representation, prefix: true
  delegate :is_approved, to: :service_agreement, prefix: true
  delegate :is_approved, to: :payment_verification, prefix: true
  delegate :is_approved, to: :disclosure_statement, prefix: true
  delegate :is_approved, to: :id_and_social, prefix: true
  delegate :is_approved, to: :first_utility, prefix: true
  delegate :is_approved, to: :second_utility, prefix: true
  delegate :is_approved, to: :police_report, prefix: true
  delegate :is_approved, to: :police_affidavit, prefix: true

  validates_presence_of :first_name, :last_name, :suffix, :phone_number, :social_security, :driver_license, :dob
  validates_presence_of :home_address, :city, :state, :zipcode, :time_at_address_years, :time_at_address_months, :residence_type, :household_payment
  validates_presence_of :occupation, :employer_name, :employment_address, :employment_city, :employment_state, :employment_zipcode, :employment_phone
  validates_presence_of :employment_gross_income, :employment_years, :employment_months
  validates_presence_of :registration_ip
  validates :approved, inclusion: { in: [true, false] }
  validates :admin, inclusion: { in: [true, false]  }

  def check_if_documents_present
    documents = set_documents
    documents.each do |document|
      puts self.send(document).present?
    end
  end

  def approve!
    unless approved
      self.update_attributes(approved: true, step_number: 1)
    end
  end

  def find_current_step
    self.step_number
  end

  def find_documents_for_current_step
    case self.find_current_step
    when 1
      User::STEP_ONE_DOCUMENTS
    when 3
      User::STEP_THREE_DOCUMENTS
    when 4
      User::STEP_FOUR_DOCUMENTS
    end
  end

  def check_all_steps
    all_steps = { '1' => User::STEP_ONE_DOCUMENTS,
                  '3' => User::STEP_THREE_DOCUMENTS,
                  '4' => User::STEP_FOUR_DOCUMENTS }

    all_steps.each do |number, step|
      step.each do |doc|
        document = self.send(doc)
        if !document.is_approved? || document.nil?
          self.update_attributes(step_number: number)
          break
        end
      end
    end
  end

  protected

  def set_phone_numbers_and_ssn
    self.phone_number = join_numbers(phone_number_1, phone_number_2, phone_number_3)
    self.other_number = join_numbers(other_phone_number_1, other_phone_number_2, other_phone_number_3)
    self.employment_phone = join_numbers(employment_phone_1, employment_phone_2, employment_phone_3)
    self.social_security = join_numbers(ss_1, ss_2, ss_3)
  end

  def join_numbers(num1, num2, num3)
    num1 + ' - ' + num2 + ' - ' + num3
  end
end
