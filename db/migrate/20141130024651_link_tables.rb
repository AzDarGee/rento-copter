class LinkTables < ActiveRecord::Migration
  def change
  	add_column :properties, :user_id, :integer
  end
end
