class CreateAttendeeAndProducerTables < ActiveRecord::Migration[5.1]
  def change
    create_table :attendees do |t|
      t.column :name, :varchar
      t.column :user_name, :varchar
      t.column :password, :varchar

      t.timestamps
    end

    create_table :producers do |t|
      t.column :name, :varchar
      t.column :user_name, :varchar
      t.column :password, :varchar

      t.timestamps
    end

    create_join_table :artists, :attendees do |t|
      t.timestamps
    end
  end
end
