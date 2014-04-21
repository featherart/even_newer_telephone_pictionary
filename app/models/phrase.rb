class Phrase < ActiveRecord::Base
  attr_accessible :text, :storyline_id, :name
  belongs_to :storyline
end
