class CreateSchedules < ActiveRecord::Migration
  def self.up
    create_table :schedules do |t|
      t.references :stylist
      t.string :day
      t.time :start_time
      t.time :end_time
      
      t.timestamps
    end
  end

  def self.down
    drop_table :schedules
  end
end
