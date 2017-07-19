class Category < ApplicationRecord
  has_many :products, dependent: :destroy
  validates :disc, :inclusion => {:in => 0..100}
end
