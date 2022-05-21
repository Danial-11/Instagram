class CreateStoryImages < ActiveRecord::Migration[7.0]
  def change
    create_table :story_images do |t|
      t.string :image
      t.references :story, null: false, foreign_key: true

      t.timestamps
    end
  end
end
