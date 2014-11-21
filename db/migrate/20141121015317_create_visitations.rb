class CreateVisitations < ActiveRecord::Migration
  def change
    create_table :visitations do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.integer :num_visitors

      t.timestamps
    end
  end
end
