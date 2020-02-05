require 'iyzipay'
require_relative 'options.rb'

# -------------------------------------------------------------
# -------------------------------------------------------------
# Subscription Product API end-point
# -------------------------------------------------------------
# -------------------------------------------------------------
product = Iyzipay::Model::V2::Product.new
# List all products
result = product.list(@options)
puts "product list: #{result.inspect}"

# Create new product
product_params = {
  locale: Iyzipay::Model::Locale::TR,
  conversationId: '12341234',
  name: 'New Product',
  description: 'My Product'
}
result = product.create(product_params, @options)
puts "product create: #{result.inspect}"
