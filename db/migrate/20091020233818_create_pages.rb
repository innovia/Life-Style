class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
     
     # Initialize Pages
     Page.create(:title => "index")    
     Page.create(:title => "services")
     Page.create(:title => "stylists")
     Page.create(:title => "products")
     Page.create(:title => "gallery")
     Page.create(:title => "about_us")
     Page.create(:title => "location")

     Page.create(:title => "keratin")
     Page.create(:title => "specials")
     Page.create(:title => "appointments")
     Page.create(:title => "contact_us")
  end

  def self.down
    drop_table :pages
  end
end
