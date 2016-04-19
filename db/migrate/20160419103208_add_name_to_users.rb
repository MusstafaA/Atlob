class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string , null: false    
    add_column :users, :avatar, :string , null: true
  end
end
