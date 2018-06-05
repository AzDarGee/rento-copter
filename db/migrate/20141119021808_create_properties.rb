class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :title
      t.float :price
      t.string :address

      t.timestamps
    end
  end
end
