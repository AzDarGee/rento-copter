class AddTypeToProperties < ActiveRecord::Migration
  def change
  	add_column :properties, :type_prop, :string
  end
end
