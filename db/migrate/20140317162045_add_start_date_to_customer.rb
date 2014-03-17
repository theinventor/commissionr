class AddStartDateToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :start_date, :date
  end
end
