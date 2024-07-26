class CreateOccupations < ActiveRecord::Migration[6.1]
  def change
    create_table :occupations do |t|

      t.timestamps
      t.string :name, null: false
    end
  end
end
