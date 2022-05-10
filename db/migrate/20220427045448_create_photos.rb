# frozen_string_literal: true

# test helper
class CreatePhotos < ActiveRecord::Migration[7.0]
  def change
    create_table :photos do |t|
      t.string :image
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
