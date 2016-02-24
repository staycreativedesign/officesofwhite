Fabricator(:document) do
  file do
    File.open(File.join(Rails.root, 'spec', 'support', 'invoice.pdf'))
  end
end
