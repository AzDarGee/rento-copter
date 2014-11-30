class RemoveEndtimeFromVisitations < ActiveRecord::Migration
  def change
  	remove_column :visitations, :end_time, :datetime
  end
end
