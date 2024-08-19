class Procedure < ApplicationRecord
  
  belongs_to :post
  
  has_one_attached :image
  
  validates :procedure_number, presence: true
  validates :title, presence: true
  validates :explain, presence: true
  
end
