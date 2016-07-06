class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|

      t.string :address_line_one
      t.string :address_line_two
      t.string :city
      t.string :state
      t.string :country
      t.integer :postal_code
      t.references :user, index: true
    end
      add_foreign_key :carts, :users
  end
end
