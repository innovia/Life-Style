class AddDescToProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :desc, :string
  end

  def self.down
    remove_column :products, :desc, :string
  end
end
