class CreateAskwordUsers < ActiveRecord::Migration
  def change
    create_table :askword_users do |t|
      t.integer :askword_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
