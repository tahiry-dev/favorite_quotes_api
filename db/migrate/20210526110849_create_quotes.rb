class CreateQuotes < ActiveRecord::Migration[6.0]
  def change
    create_table :quotes do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.decimal :price, precision: 6, scale: 2
      t.string :ratings
      t.string :usedFor

      t.timestamps
    end
  end
end
