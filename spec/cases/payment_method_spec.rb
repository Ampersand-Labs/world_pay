require 'spec_helper'

describe "WorldPayApi::Api::PaymentMethod" do
  before(:each) do
    @service = WorldPayApi::Client.new ENV['PS_WORLDPAY_VERSION'].to_sym, ENV['PS_WORLDPAY_SECURE_KEY']
    @customer_id = "5000006"
  end
  
  it "creates a payment method" do
    @service = WorldPayApi::Client.new ENV['PS_WORLDPAY_VERSION'].to_sym, ENV['PS_WORLDPAY_SECURE_KEY']
    payment_method = JSON.parse(File.read((File.expand_path '../..', __FILE__) + "/fixtures/payment_method.json"))
    params = {body: payment_method}
    @customer = @service.payment_method.create @customer_id, params
    expect(@customer["result"]).to eq('SUCCESS').or eq('APPROVED')
  end
  
end
