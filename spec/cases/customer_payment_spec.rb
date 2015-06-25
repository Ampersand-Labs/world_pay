require 'spec_helper'

describe "WorldPayApi::Api::CustomerPayment" do

  it "creates a customer and a payment method for new customer" do
    @service = WorldPayApi::Client.new ENV['PS_WORLDPAY_VERSION'].to_sym, ENV['PS_WORLDPAY_SECURE_KEY']
    customer_payment = JSON.parse(File.read((File.expand_path '../..', __FILE__) + "/fixtures/customer_payment.json"))
    params = {body: customer_payment}
    @customer = @service.customer_payment.create params
    expect(@customer["result"]).to eq('SUCCESS').or eq('APPROVED')
  end
  
end