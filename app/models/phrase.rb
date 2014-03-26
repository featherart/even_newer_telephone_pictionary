class Phrase < ActiveRecord::Base
  attr_accessible :text, :storyline_id
  belongs_to :storyline
end
