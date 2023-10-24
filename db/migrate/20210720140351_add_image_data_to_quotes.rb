class AddImageDataToQuotes < ActiveRecord::Migration[6.0]
  def change
    add_column :quotes, :image_data, :text
  end
end
