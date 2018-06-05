class ChangeVisitationTable < ActiveRecord::Migration
  def change
    drop_table :visitations

    create_table :visitations do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.references :property
      t.references :user
      t.text :notes

      t.timestamps
    end
    add_index :visitations, :property_id
    add_index :visitations, :user_id
  end
end
