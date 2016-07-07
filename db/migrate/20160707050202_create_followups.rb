class CreateFollowups < ActiveRecord::Migration
  def change
    create_table :followups do |t|
      t.string :internet_type
      t.string :internet_speed
      t.integer :monthly_cost
      t.string :community_name
  end

      add_foreign_key :users, :details
  end
end
