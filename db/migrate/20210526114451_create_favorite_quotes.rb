class CreateFavoriteQuotes < ActiveRecord::Migration[6.0]
  def change
    create_table :favorite_quotes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :quote, null: false, foreign_key: true

      t.timestamps
    end
  end
end
