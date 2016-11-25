class AddLastNameToDeveloper < ActiveRecord::Migration
  def change
    add_column :developers, :last_name, :string
    rename_column :developers, :name, :first_name
  end
end
