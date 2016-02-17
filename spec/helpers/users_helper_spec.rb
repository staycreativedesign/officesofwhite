require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the UsersHelper. For example:
#
# describe UsersHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe UsersHelper, type: :helper do
  describe '#suffix_options' do
    it 'to return suffixes' do
      expect(helper.suffix_options).to eq [ ['Mr.', 'mr.'], ['Mrs.', 'mrs.'], ['Ms.', 'ms'], ['Dr.', 'dr']]
    end
  end

  describe '#date_of_birth_options' do
    it 'returns a day month year option' do
      expect(helper.date_of_birth_options).to eq({:start_year=>1901, :end_year=>2010, :order=>[:month, :day, :year], :prompt=>{:day=>" Day", :month=>"Month", :year=>"Year"}})
     end
  end

  describe '#states_abbr' do
    it 'returns all listed states' do
      expect(helper.states_abbr).to eq ['AL','AK', 'AZ', 'AR','CA', 'CO', 'CT','DE', 'DC', 'FL','GA', 'HI', 'ID', 'IL', 'IN', 'IA', 'KS', 'KY', 'LA', 'ME', 'MD', 'MA', 'MI', 'MN', 'MS', 'MO', 'MT', 'NE', 'NV', 'NH', 'NJ', 'NM', 'NY', 'NC', 'ND', 'OH', 'OK', 'OR', 'PA', 'PR', 'RI', 'SC', 'SD', 'TN', 'TX', 'UT', 'VT', 'VA', 'WA', 'WV','WI','WY']
    end
  end

  describe '#time_at_address(number)' do
    it 'returns an array ' do
      expect(helper.time_at_address(1)).to eq([0,1])
    end

  end

  describe '#residence_type' do
    it 'returns array' do
      expect(helper.residence_type).to eq(["Rent", "Own", "Other"])
    end
  end
end
