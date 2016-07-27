class CreateAskwords < ActiveRecord::Migration
  def change
    create_table :askwords do |t|
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
