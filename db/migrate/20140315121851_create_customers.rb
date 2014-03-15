class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :dob
      t.string :carrier
      t.integer :expected_amount_cents

      t.timestamps
    end
  end
end
