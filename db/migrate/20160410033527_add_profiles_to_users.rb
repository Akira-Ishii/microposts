class AddProfilesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :age, :integer
    add_column :users, :area, :string
    add_column :users, :body, :string
  end
end
