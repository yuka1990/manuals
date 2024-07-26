class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|

      t.timestamps
      t.string :name, null: false
      t.text :introduction, null: false
      t.integer :owner_id, null: false
    end
  end
end
