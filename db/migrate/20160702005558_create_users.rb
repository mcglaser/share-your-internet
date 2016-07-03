class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

      t.string :email
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.string :address_line_one
      t.string :address_line_two
      t.string :city
      t.string :state
      t.string :country
      t.boolean :pays_for_internet
      t.boolean :lives_in_community
      t.string :internet_type
      t.string :internet_speed
      t.decimal :monthly_cost, :precision => 8, :scale => 2
      t.string :community_name
      t.boolean :admin, default: false

      t.timestamps null: false
    end
  end
end
