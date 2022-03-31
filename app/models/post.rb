class Post < ApplicationRecord
	has_many :comments, dependent: :destroy
	belongs_to :user
	has_many :likes, dependent: :destroy
	has_one_attached :image 
	validates :title, presence: true, length: { maximum: 20 }
  validates :description, presence: true 
  validates :image, presence: true
  scope :recent_first, -> {order(created_at: :desc)}
  
end
