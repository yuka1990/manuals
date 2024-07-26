class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|

      t.timestamps
      t.string :name, null: false
    end
  end
end
