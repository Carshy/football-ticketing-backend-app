class AddUserReferencesToMatch < ActiveRecord::Migration[7.0]
  def change
    add_reference :matches, :user, null: false, foreign_key: true
  end
end
