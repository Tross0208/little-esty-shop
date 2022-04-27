class CreateBulkdiscount < ActiveRecord::Migration[5.2]
  def change
    create_table :bulkdiscounts do |t|
      t.integer :quantity
      t.float :percent_discount
      t.references :merchant, foreign_key: true
    end
  end
end
