class CreateServices < ActiveRecord::Migration
  def self.up
    create_table :services do |t|
      t.string :name
      t.references :category
      t.integer :start_price
      t.integer :end_price
      t.timestamps
    end
  end

  def self.down
    drop_table :services
  end
end
