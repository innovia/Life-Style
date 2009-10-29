class Picture < ActiveRecord::Base
  has_attached_file :photo,
                    :styles => {:small => "150x150>", :thumb => "100x100>", :original => "400x400>"}

  # Set passed-in order for passed-in ids.
  def self.order(ids)
    update_all(
      ['sort_order = FIND_IN_SET(id, ?)', ids.join(',')],
      { :id => ids }
    )
  end



end
