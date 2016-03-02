Fabricator(:document) do
  file {
    ActionDispatch::Http::UploadedFile.new(
      :tempfile => File.new(Rails.root.join("spec/support/invoice.pdf")),
      :filename => File.basename(File.new(Rails.root.join("spec/support/invoice.pdf")))
    )
  }
end
