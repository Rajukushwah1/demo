class Post < ApplicationRecord
	has_many :comments
	belongs_to :user
	has_one_attached :image   
	#add image to post image_attachment

	validates :title,
     presence: true,
     length: { maximum: 20 }
     
    validates :description, presence: true 

    validates :image, presence: true
   

 
    #validate :image_type

	# private

	# def image_type
	#    if image.attached? == false
	#      errors.add(:image, "is missing!")
	#    end
	#    if !image.content_type.in?(%('image/jpeg image/png'))
	#      errors.add(:image, "needs to be a jpeg or png!")
	#    end
	# end
	    
end