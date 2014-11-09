class AddPicturesToProducts < ActiveRecord::Migration
  def change
    add_column :products, :picture_file_name, :string
    add_column :products, :picture_content_type, :string
    add_column :products, :picture_file_size, :integer
    add_column :products, :picture_updated_at, :datetime

    add_column :products, :picture1_file_name, :string
    add_column :products, :picture1_content_type, :string
    add_column :products, :picture1_file_size, :integer
    add_column :products, :picture1_updated_at, :datetime

    add_column :products, :picture2_file_name, :string
    add_column :products, :picture2_content_type, :string
    add_column :products, :picture2_file_size, :integer
    add_column :products, :picture2_updated_at, :datetime

    add_column :products, :picture3_file_name, :string
    add_column :products, :picture3_content_type, :string
    add_column :products, :picture3_file_size, :integer
    add_column :products, :picture3_updated_at, :datetime

    add_column :products, :picture4_file_name, :string
    add_column :products, :picture4_content_type, :string
    add_column :products, :picture4_file_size, :integer
    add_column :products, :picture4_updated_at, :datetime

    add_column :products, :picture5_file_name, :string
    add_column :products, :picture5_content_type, :string
    add_column :products, :picture5_file_size, :integer
    add_column :products, :picture5_updated_at, :datetime

    add_column :products, :picture6_file_name, :string
    add_column :products, :picture6_content_type, :string
    add_column :products, :picture6_file_size, :integer
    add_column :products, :picture6_updated_at, :datetime

    add_column :products, :picture7_file_name, :string
    add_column :products, :picture7_content_type, :string
    add_column :products, :picture7_file_size, :integer
    add_column :products, :picture7_updated_at, :datetime

    add_column :products, :picture8_file_name, :string
    add_column :products, :picture8_content_type, :string
    add_column :products, :picture8_file_size, :integer
    add_column :products, :picture8_updated_at, :datetime

    add_column :products, :picture9_file_name, :string
    add_column :products, :picture9_content_type, :string
    add_column :products, :picture9_file_size, :integer
    add_column :products, :picture9_updated_at, :datetime
  end
end
