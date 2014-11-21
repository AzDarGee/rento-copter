class Visitation < ActiveRecord::Base
  belongs_to :user
  belongs_to :property

  # Validate that the number of people should be more than 0 and less than 5
  validates :num_people, :numericality => { :only_integer => true, :greater_than => 0, :less_than => 5 }

end
