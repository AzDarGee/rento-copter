class AddAgentToVisitations < ActiveRecord::Migration
  def change
  	add_column :visitations, :agent, :string
  end
end
