class User < ActiveRecord::Base
    has_secure_password
    has_many :rides
    validates_presence_of :name :email, :password true
    validates :email, uniqueness: true
    
end