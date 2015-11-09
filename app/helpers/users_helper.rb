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
end
