class Picture < ActiveRecord::Base
  attr_accessible :image, :storyline_id, :name
  belongs_to :storyline
end
