class CreateStylists < ActiveRecord::Migration
  def self.up
    create_table :stylists do |t|
      t.string :first_name
      t.string :last_name
      t.text  :bio
      
      t.timestamps
    end
  end

  def self.down
    drop_table :stylists
  end
end
