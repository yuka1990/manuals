class CreateProcedures < ActiveRecord::Migration[6.1]
  def change
    create_table :procedures do |t|

      t.timestamps
      t.references :post, foreign_key: true
      t.integer :procedure_number, null: false
      t.string :title, null: false
      t.text :explain, null: false
    end
  end
end
