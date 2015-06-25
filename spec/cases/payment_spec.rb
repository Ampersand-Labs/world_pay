require 'spec_helper'

describe "WorldPayApi::Api::Payment" do  
  it "authorizes a Vault Payment" do
    @service = WorldPayApi::Client.new ENV['PS_WORLDPAY_VERSION'].to_sym, ENV['PS_WORLDPAY_SECURE_KEY']
    payment_verify = JSON.parse(File.read((File.expand_path '../..', __FILE__) + "/fixtures/payment_auth_charge.json"))
    params = {body: payment_verify}
    @customer = @service.payment.authorize params
    expect(@customer["result"]).to eq('SUCCESS').or eq('APPROVED')
  end
  
  it "Charges a Vault Payment" do
    @service = WorldPayApi::Client.new ENV['PS_WORLDPAY_VERSION'].to_sym, ENV['PS_WORLDPAY_SECURE_KEY']
    payment_verify = JSON.parse(File.read((File.expand_path '../..', __FILE__) + "/fixtures/payment_auth_charge.json"))
    params = {body: payment_verify}
    @customer = @service.payment.charge params
    expect(@customer["result"]).to eq('SUCCESS').or eq('APPROVED')
  end
  
end
