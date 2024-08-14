class Category < ApplicationRecord
  
  has_many :posts, dependent: :destroy
  has_many :requests, dependent: :destroy
  
  validates :name, presence: true
  
end
