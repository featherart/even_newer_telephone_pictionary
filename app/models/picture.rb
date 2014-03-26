class Picture < ActiveRecord::Base
  attr_accessible :image, :storyline_id
  belongs_to :storyline
end
