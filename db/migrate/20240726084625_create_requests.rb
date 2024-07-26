class CreateRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :requests do |t|

      t.timestamps
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true
      t.string :title, null: false
      t.text :body, null: false
      t.integer :status, null: false
      
    end
  end
end
