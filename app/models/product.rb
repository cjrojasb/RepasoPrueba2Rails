class Product < ApplicationRecord
  #belongs_to :category, optional: true -> Categoria es opcional
  belongs_to :category
  validates :price, presence: true
  before_save :check_premium

  scope :scopePremium, -> {where(premium: true)}
  scope :last_n, (->(n) { order(:id).limit(n) })

  after_destroy :check_last

  def check_premium
    if self.premium.nil?
      self.premium = false
    end
  end

  def check_last
    category.destroy unless category.products.any?
  end

  def lastProduct
    category.products.count == 1 ? true : false
  end

  def price_final
    self.price*(100 - self.category.disc)/100
  end

end





