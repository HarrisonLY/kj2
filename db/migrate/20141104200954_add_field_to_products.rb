class AddFieldToProducts < ActiveRecord::Migration
  def change
  	add_column :products, :company, :string
  end
end
