class CreateGuests < ActiveRecord::Migration[5.0]
  def change
    create_table :guests do |t|
      t.string :first_name
      t.string :last_name
      t.string :company
      t.string :guest_of
      t.integer :month
      t.integer :year
      t.boolean :attended
      t.string :email
      t.string :linkedin_url

      t.timestamps
    end
  end
end
