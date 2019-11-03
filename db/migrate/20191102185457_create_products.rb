class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name 
      t.string :description
      t.string :condition
      t.float :price
      t.boolean :available
      t.timestamps
  end
  end
end
