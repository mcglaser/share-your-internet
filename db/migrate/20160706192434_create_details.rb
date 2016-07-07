class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
      t.boolean :pays_for_internet
      t.boolean :lives_in_community
      t.references :user, index: true

    end
  end
end
