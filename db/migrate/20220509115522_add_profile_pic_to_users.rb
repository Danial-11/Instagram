class AddProfilePicToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :ProfilePic, :string
  end
end
