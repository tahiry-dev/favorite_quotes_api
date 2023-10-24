class CreateQuotes < ActiveRecord::Migration[6.0]
  def change
    create_table :quotes do |t|
      t.string :author
      t.string :description
      t.string :ratings

      t.timestamps
    end
  end
end
