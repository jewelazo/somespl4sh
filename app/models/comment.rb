class Comment < ApplicationRecord
     # Validations
     validates :body, presence: true 
 
     # Associations
     belongs_to :commentable, polymorphic: true
end
