class Article < ActiveRecord::Base
    
    #adding validations to maintain integrity
    validates :title, presence: true, length: {minimum: 3, maximum: 50}
    validates :description, presence:true, length: {minimum: 10, maximum: 300}
end