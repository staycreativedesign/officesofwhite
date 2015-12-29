module UsersHelper
  def suffix_options
   [
     ['Mr.','mr.'],
     ['Mrs.','mrs.']
   ]
  end

  def date_of_birth_options
    {
    start_year: 1901, end_year: 2010, order: [:month, :day, :year], prompt: { day: 'Select day', month: 'Select month', year: 'Select year' }
    }
  end
  def states_abbr
    ['AL','AK', 'AZ', 'AR','CA', 'CO', 'CT','DE', 'DC', 'FL','GA', 'HI', 'ID', 'IL', 'IN', 'IA', 'KS', 'KY', 'LA', 'ME', 'MD', 'MA', 'MI', 'MN', 'MS', 'MO', 'MT', 'NE', 'NV', 'NH', 'NJ', 'NM', 'NY', 'NC', 'ND', 'OH', 'OK', 'OR', 'PA', 'PR', 'RI', 'SC', 'SD', 'TN', 'TX', 'UT', 'VT', 'VA', 'WA', 'WV','WI','WY']
  end

  def time_at_address(number)
    array = Array.new
    array << 0
    1.upto(number) { |n| array << n }
    array
  end
  def residence_type
    array = ["Rent", "Own", "Other"]
  end
end
