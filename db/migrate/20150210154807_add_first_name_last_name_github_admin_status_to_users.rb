class AddFirstNameLastNameGithubAdminStatusToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :github, :string
    add_column :users, :admin_status, :boolean
  end
end
