class CreateServices < ActiveRecord::Migration
  def self.up
    create_table :services do |t|
      t.references :category
      t.string :name
      t.integer :stylist_start_price
      t.integer :stylist_end_price
      t.integer :senior_start_price
      t.integer :senior_end_price
      t.integer :master_start_price
      t.integer :master_end_price
      
      t.timestamps
    end
  end

  def self.down
    drop_table :services
  end
end
