class Player < ActiveRecord::Base
  belongs_to :team
  
  validates_presence_of :sur_name, :on => :save
  validates_presence_of :given_name, :on => :save
  validates_presence_of :team_abbreviation, :on => :save
  
  def full_name
    "#{given_name} #{sur_name}"
  end
  
  def team_name
    team.name if team
  end
  
  def team_name=(name)
    self.team = Team.find_by_name(name) unless name.blank?
  end
end
