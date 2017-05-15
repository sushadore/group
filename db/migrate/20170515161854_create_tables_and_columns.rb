class CreateTablesAndColumns < ActiveRecord::Migration[5.1]
  def change
    create_table :artists do |t|
      t.column :name, :varchar

      t.timestamps
    end

    create_table :stages do |t|
      t.column :name, :varchar
      t.column :location, :integer

      t.timestamps
    end

    create_join_table :artists, :stages, table_name: :performances do |t|
      t.column :performance_time, :timestamp

      t.timestamps
    end
  end
end
