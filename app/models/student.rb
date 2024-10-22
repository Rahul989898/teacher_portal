class Student < ApplicationRecord
  belongs_to :teacher
  # belongs_to :subject # Add this line if students belong to a subject

end
