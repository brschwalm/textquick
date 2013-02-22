class AddIsBlockedToUser < ActiveRecord::Migration
  def change

    #add a is_blocked field to the the users table defaulting to false
    add_column :users, :is_blocked, :boolean, :default => false, :null => false

  end
end
