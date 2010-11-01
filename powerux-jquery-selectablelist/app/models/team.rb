class Team < ActiveRecord::Base
  has_many :players
  
  def self.locate()
    select('name, latitude, longitude').all
  end
end
