class AddNumPeopleToVisitation < ActiveRecord::Migration
  def change
    add_column :visitations, :num_people, :integer, :default => 1
  end
end
