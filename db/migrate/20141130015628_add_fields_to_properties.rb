class AddFieldsToProperties < ActiveRecord::Migration
  def change
  	add_column :properties, :num_rooms, :integer
  	add_column :properties, :num_bathrooms, :integer
  	add_column :properties, :num_accomodates, :integer
  end
end
