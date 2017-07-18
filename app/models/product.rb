class Product < ApplicationRecord
  #belongs_to :category, optional: true -> Categoria es opcional
  belongs_to :category
  validates :price, presence: true
  before_save :check_premium
  scope :scopePremium, -> {where(premium: true)}
  scope :last_n, (->(n) { order(:id).limit(n) })

  def check_premium
    if self.premium.nil?
      self.premium = false
    end
  end

end
