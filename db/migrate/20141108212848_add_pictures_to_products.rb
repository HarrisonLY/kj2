class AddPicturesToProducts < ActiveRecord::Migration
  def change
    add_column :products, :picture_file_name, :string
    add_column :products, :picture_content_type, :string
    add_column :products, :picture_file_size, :integer
    add_column :products, :picture_updated_at, :datetime
  end
end
