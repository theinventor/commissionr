class CreateCommissions < ActiveRecord::Migration
  def change
    create_table :commissions do |t|
      t.integer :customer_id
      t.string :month
      t.string :year
      t.integer :amount_cents

      t.timestamps
    end
  end
end
