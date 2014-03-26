class Turn < ActiveRecord::Base
  attr_accessible :turn_number, :user_id
  belongs_to :user
end
