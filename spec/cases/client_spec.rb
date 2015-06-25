require 'spec_helper'

describe "WorldPlayApi::Client" do
  it "has an attr_reader for access token" do
    secure_key = 'adfadf'
    service = WorldPayApi::Client.new :sandbox, secure_key
    expect(service.secure_key).to eq(secure_key)
  end

  it "has an attr_reader for server" do
    service = WorldPayApi::Client.new :sandbox, double
    expect(service.server).to eq('https://gwapi.demo.securenet.com')
  end
end