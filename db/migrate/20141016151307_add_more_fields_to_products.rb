class AddMoreFieldsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :website, :string
    add_column :products, :image_file_name, :string
    add_column :products, :industry, :string
  end
end
