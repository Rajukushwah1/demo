class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    validates :email,
      presence: true,
        length: { maximum: 25 },
        format: { with: URI::MailTo::EMAIL_REGEXP }
    
    validates :name, presence: true  

    validates :address, presence: true  
  
    validates :mobile_no,:presence => true,
              :numericality => true,
              :length => { :minimum => 10, :maximum => 12 }

    has_many :posts  
    has_many :comments
    has_many :likes
    # has_many :friendshipes
    # has_many :friends, :through => :friendshipes      
end
