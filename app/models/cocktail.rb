class Cocktail < ApplicationRecord
  has_many :doses
  has_many :ingredients, through: :doses, dependent: :destroy
  validates :name, uniqueness: true
  validates :stars, inclusion: { in: [0,1,2,3,4,5] }
end
