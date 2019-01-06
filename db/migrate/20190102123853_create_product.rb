class CreateProduct < ActiveRecord::Migration[4.2]
  def self.up
    create_table :products do |t|
      t.string :name
      t.float :price
    end
  end
  def self.down
    drop_table :products
  end
end
