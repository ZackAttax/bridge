class Ride <ActiveRecord::Base
    belongs_to :user
    validates :name, uniqueness: true
    validates_presence_of :name

end