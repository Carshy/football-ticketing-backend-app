class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.string :stadium
      t.string :location
      t.string :date
      t.integer :price
      t.string :home_team
      t.string :away_team
      t.string :photo

      t.timestamps
    end
  end
end
