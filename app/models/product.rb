class Product < ActiveRecord::Base
  validates :title, :description, presence: true
  validates :title, length: { minimum: 5, message: 'Title must be at least 5 characters' }
  validates :price, numericality: {
    greater_than: 0
  }
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpe{0,1}g|png)\Z}i,
    message: 'Image must be a gif, url or png'
  }
  validates :title, uniqueness: true

  def self.latest
    Product.order(:updated_at).last
  end
end
