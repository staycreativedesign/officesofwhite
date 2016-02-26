module Documents
  extend ActiveSupport::Concern
  included do

    #STEP 1
    STEP_ONE_DOCUMENTS = [:service_agreement, :letter_of_representation, :disclosure_statement]
    belongs_to :disclosure_statement, class_name: "Document"
    belongs_to :letter_of_representation, class_name: "Document"
    belongs_to :service_agreement, class_name: "Document"
    accepts_nested_attributes_for(*STEP_ONE_DOCUMENTS)

  end
end
