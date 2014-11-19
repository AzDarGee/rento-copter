class ChangePropertyTable < ActiveRecord::Migration
  def change
    drop_table :properties

   create_table :properties do |t|
      t.string :title
      t.float :rent
      t.string :address
      t.text :description

      t.timestamps
    end
  end
end
