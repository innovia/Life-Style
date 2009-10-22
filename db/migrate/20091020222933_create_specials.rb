class CreateSpecials < ActiveRecord::Migration
  def self.up
    create_table :specials do |t|
      t.string :title
      t.text :description
      t.timestamp :start_date
      t.timestamp :end_date
      t.references :service
      t.decimal :price

      t.timestamps
    end
  end

  def self.down
    drop_table :specials
  end
end
