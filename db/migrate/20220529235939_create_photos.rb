# frozen_string_literal: true

# class
class CreatePhotos < ActiveRecord::Migration[7.0]
  def change
    create_table :photos do |t|
      t.string :image
      t.references :post, null: true, foreign_key: true
      t.references :story, null: true, foreign_key: true
      t.references :imageable, polymorphic: true

      t.timestamps
    end
  end
end
