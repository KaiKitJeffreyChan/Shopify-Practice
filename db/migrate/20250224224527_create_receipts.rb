class CreateReceipts < ActiveRecord::Migration[8.0]
  def change
    create_table :receipts do |t|
      t.string :retailer
      t.date :purchase_date
      t.time :purchase_time
      t.string :total

      t.timestamps
    end
  end
end
