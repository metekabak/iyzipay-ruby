require 'iyzipay'

@options = Iyzipay::Options.new
@options.api_key = 'YOUR_API_KEY'
@options.secret_key = 'YOUR_SECRET_KEY'
@options.base_url = 'https://sandbox-api.iyzipay.com' # use https://api.iyzipay.com for production

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
