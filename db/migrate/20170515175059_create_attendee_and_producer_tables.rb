class CreateAttendeeAndProducerTables < ActiveRecord::Migration[5.1]
  def change
    create_table :attendees do |t|
      t.column :name, :varchar
<<<<<<< HEAD
      t.column :user_name, :varchar
=======
>>>>>>> 8ce65b4c8e2d100e4b6ef2a8f384f5e168956f7a
      t.column :username, :varchar
      t.column :password, :varchar

      t.timestamps
    end

    create_table :producers do |t|
      t.column :name, :varchar
<<<<<<< HEAD
      t.column :user_name, :varchar
=======
>>>>>>> 8ce65b4c8e2d100e4b6ef2a8f384f5e168956f7a
      t.column :username, :varchar
      t.column :password, :varchar

      t.timestamps
    end

    create_join_table :artists, :attendees do |t|
      t.timestamps
    end
  end
end
