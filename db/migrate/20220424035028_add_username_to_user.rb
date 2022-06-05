# frozen_string_literal: true

# add user name
class AddUsernameToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username, :string, null: false, default: ''
  end
end
