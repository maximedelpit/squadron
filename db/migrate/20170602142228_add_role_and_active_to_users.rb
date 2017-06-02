class AddRoleAndActiveToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :role, :string, default: 'freelance'
    add_column :users, :active, :boolean, default: true
  end
end
