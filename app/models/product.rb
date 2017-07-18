class Product < ApplicationRecord
  #belongs_to :category, optional: true -> Categoria es opcional
  belongs_to :category
  validates :price, presence: true
  before_save :addColumFalse

  def addColumFalse
    if self.premium.nil?
      self.premium = false
    end
  end

end
