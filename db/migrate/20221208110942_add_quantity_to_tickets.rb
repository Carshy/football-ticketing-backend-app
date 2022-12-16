class AddQuantityToTickets < ActiveRecord::Migration[7.0]
  def change
    add_column :tickets, :quantity, :integer
  end
end
