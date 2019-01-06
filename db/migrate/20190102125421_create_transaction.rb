class CreateTransaction < ActiveRecord::Migration[4.2]
  def self.up
    create_table :transactions do |t|
      t.integer :amount
      t.float :total_price
      t.integer :product_id
    end

    add_index :transactions, :product_id
  end
  def self.down
    drop_table :transactions
  end
end
