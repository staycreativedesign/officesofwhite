module Documents
  extend ActiveSupport::Concern
  included do

    #STEP 1
    STEP_ONE_DOCUMENTS = [:letter_of_representation, :payment_verification, :disclosure_statement]
    belongs_to :disclosure_statement, class_name: "Document"
    belongs_to :letter_of_representation, class_name: "Document"
    belongs_to :payment_verification, class_name: "Document"
    accepts_nested_attributes_for(*STEP_ONE_DOCUMENTS)

  end
end
