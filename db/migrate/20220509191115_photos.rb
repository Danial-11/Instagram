class Photos < ActiveRecord::Migration[7.0]
  def change
    t.references :photo, null: false, foreign_key: true
  end
end
