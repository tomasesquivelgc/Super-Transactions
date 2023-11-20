class CreateTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :transactions do |t|
      t.string :name
      t.integer :amount

      t.timestamps
    end
  end
end
