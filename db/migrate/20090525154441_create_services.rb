class CreateServices < ActiveRecord::Migration
  def self.up
    create_table :services do |t|
      t.references :category
      t.string :name
      t.integer :beginner_start_price
      t.integer :beginner_end_price
      t.integer :intermidiate_start_price
      t.integer :intermidiate_end_price
      t.integer :senior_start_price
      t.integer :senior_end_price
      t.timestamps
    end
  end

  def self.down
    drop_table :services
  end
end
