module Documents
  extend ActiveSupport::Concern
  included do

    STEP_ONE_DOCUMENTS = [:service_agreement, :letter_of_representation, :disclosure_statement]
    belongs_to :disclosure_statement, class_name: "Document"
    belongs_to :letter_of_representation, class_name: "Document"
    belongs_to :service_agreement, class_name: "Document"
    accepts_nested_attributes_for(*STEP_ONE_DOCUMENTS)

    STEP_THREE_DOCUMENTS = [:id_and_social, :first_utility, :second_utility]
    belongs_to :id_and_social, class_name: "Document"
    belongs_to :first_utility, class_name: "Document"
    belongs_to :second_utility, class_name: "Document"
    accepts_nested_attributes_for(*STEP_THREE_DOCUMENTS)

    STEP_FOUR_DOCUMENTS = [:police_report, :police_affidavit]
    belongs_to :police_report, class_name: "Document"
    belongs_to :police_affidavit, class_name: "Document"
    accepts_nested_attributes_for(*STEP_FOUR_DOCUMENTS)
  end
end
