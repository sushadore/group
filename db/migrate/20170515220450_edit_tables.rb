class EditTables < ActiveRecord::Migration[5.1]
  def change
    add_column :artists, :user_reviews, :varchar
    add_column :artists, :bio, :varchar
    add_column :artists_attendees, :ranking, :integer
    rename_table :artists_attendees, :favorites
  end
end
