class Photo < ApplicationRecord
    # Validations
    validates :title, presence: true 
    validates :description, presence: true

    # Associations
    belongs_to :category, counter_cache: true
    has_many :comments,as: :commentable, dependent: :destroy
    has_one_attached :image
end
