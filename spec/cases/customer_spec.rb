require 'spec_helper'

describe "WorldPayApi::Api::Customer" do

  it "creates a customer" do
    @service = WorldPayApi::Client.new ENV['PS_WORLDPAY_VERSION'].to_sym, ENV['PS_WORLDPAY_SECURE_KEY']
    customer = JSON.parse(File.read((File.expand_path '../..', __FILE__) + "/fixtures/customer.json"))
    params = {body: customer}
    @customer = @service.customer.create params
    expect(@customer["result"]).to eq('SUCCESS').or eq('APPROVED')
  end
  
end
