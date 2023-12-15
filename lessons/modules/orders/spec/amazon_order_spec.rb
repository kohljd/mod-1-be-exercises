require './lib/amazon_order'

RSpec.describe AmazonOrder do
  before :each do
    @order = AmazonOrder.new
  end

  it 'exists' do
    expect(@order).to be_a(AmazonOrder)
  end

  it 'can return a confirmation message' do
    expect(@order.confirmation("exercise equipment")).to eq("You got exercise equipment.")
  end

  it 'can return a delivery message' do
  #expect for if/else delivery statement
    # expect(@order.delivery).to eq("Your order will arrive in 2 business days.")
  
  #expect for dynamic delivery method
    expect(@order.delivery("order", "2 business days")).to eq("Your order will arrive in 2 business days.")
  end

  it 'can return a review request' do
    expect(@order.review).to eq("Please rate your order within 30 days.")
  end
end
