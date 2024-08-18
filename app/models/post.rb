class Post < ApplicationRecord
  
  belongs_to :category
  
  has_many :procedures, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  has_many_attached :files
  
  validates :category_id, presence: true
  validates :title, presence: true
  validates :body, presence: true
  validates :level, presence: true
  validates :status, presence: true
  
  enum level: { Beginner: 0, Intermediate: 1, Advanced: 2, Pro: 3 }
  enum status: { Draft: 0, Awaiting_approval: 1, Publish: 2 }
  
end
