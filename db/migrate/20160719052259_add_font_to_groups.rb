class AddFontToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :font, :string
  end
end
