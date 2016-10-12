class CreateLinkedinProfiles < ActiveRecord::Migration[5.0]
  def up
    create_table :linkedin_profiles, id: false do |t|
      t.string :url, index: true, unique: true, null: false
      t.string :photo_url
      t.string :headline

      t.timestamps
    end
    execute "ALTER TABLE linkedin_profiles ADD PRIMARY KEY (url)"
  end

  def down
    drop_table :linkedin_profiles
  end
end
