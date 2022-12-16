class AddDateAndCityToTickets < ActiveRecord::Migration[7.0]
  def change
    add_column :tickets, :date, :string
    add_column :tickets, :city, :string
  end
end
