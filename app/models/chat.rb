class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :room
  
  validates :message, presense: true, length: {maximum: 140 }
end
