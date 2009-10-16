class CreateAppointments < ActiveRecord::Migration
  def self.up
    create_table :appointments do |t|
      t.string :first_name
      t.string :last_name
      t.integer :service_id
      t.string :gender
      t.string :email
      t.string :phone_number
      t.integer :stylist_id
      t.timestamp :requested_time
      t.timestamps
    end
  end

  def self.down
    drop_table :appointments
  end
end
