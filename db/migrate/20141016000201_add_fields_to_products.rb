class AddFieldsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :releasing_on, :date
  end
end
