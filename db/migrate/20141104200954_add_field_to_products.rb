class AddFieldToProducts < ActiveRecord::Migration
  def change
  	add_column :products, :company, :string
  	add_column :products, :total_clocks, :integer
  end
end
