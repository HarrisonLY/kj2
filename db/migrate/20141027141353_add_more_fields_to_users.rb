class AddMoreFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :born_in, :year
    add_column :users, :gender, :string
  end
end


