class Message < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :description, presence: true
  belongs_to :user
  has_many :comments
end
