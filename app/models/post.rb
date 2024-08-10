class Post < ApplicationRecord
  
  belongs_to :user
  belongs_to :category
  
  has_many :procedures, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
end
