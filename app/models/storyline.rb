class Storyline < ActiveRecord::Base
  attr_accessible :turn, :user_id, :active, :time_stop, :story_name, :num_players
  has_many :pictures
  has_many :phrases
  has_many :players
  accepts_nested_attributes_for :players, allow_destroy: true
end
