class ChangeUsersTable < ActiveRecord::Migration
  def change
    drop_table :users

    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :role

      t.timestamps
    end
  end
end
