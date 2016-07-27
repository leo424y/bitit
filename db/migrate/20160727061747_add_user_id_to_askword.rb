class AddUserIdToAskword < ActiveRecord::Migration
  def change
    add_column :askwords, :user_id, :integer
  end
end
