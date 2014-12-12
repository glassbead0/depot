require 'test_helper'

class ProductTest < ActiveSupport::TestCase
	fixtures :products

  test 'product attributes must not be empty' do
  	product = Product.new(image_url: 'pizza')
  	assert product.invalid?
  	assert product.errors[:title].any?
  	assert product.errors[:description].any?
  	assert product.errors[:image_url].any?
  	assert product.errors[:price].any?  	
  end

  test 'product price must be positive' do
  	product = Product.new(
  		title: 'something',
  		description: 'things and such',
  		image_url: 'stuff.jpg',
  		price: -1)
  	assert product.invalid?
  	assert_equal product.errors[:price], ['must be greater than 0']

  	product.price = 0
  	assert_equal product.errors[:price], ['must be greater than 0']

  	product.price = 1
  	assert product.valid?
  end

  def new_product(image_url)
  	Product.new(
  		title: 'MyTitle',
  		description: 'My Description', 
  		image_url: image_url,
  		price: 10)
  end

  test 'image_url' do
  	allowed = ['stuff.jpg', 'things.png', 'PIC.GIF', 'potatoes.Jpg', 'bus.jpeg']
  	not_allowed = ['image.img', 'jpg.picture', 'img.ai', 'doc.pdf', 'paper.doc']

  	allowed.each do |file|
  	  assert new_product(file).valid?, "#{file} should be valid"
  	end

  	not_allowed.each do |file|
  		assert new_product(file).invalid?, "#{name} should not be valid"
  	end
  end

  test 'product is not valid without unique title' do
  	product = Product.new(
  		title: products(:clock).title,
  		description: 'things',
  		image_url: 'stuff.jpg',
  		price: '10')
  	assert product.invalid?
  	assert_equal product.errors[:title], [I18n.translate('errors.messages.taken')]
  end
end
