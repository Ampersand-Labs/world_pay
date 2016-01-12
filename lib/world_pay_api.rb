require "world_pay_api/version"

module WorldPayApi
  require 'world_pay_api/client'

  require 'world_pay_api/api/base'
  require 'world_pay_api/api/customer'
  require 'world_pay_api/api/customer_payment'
  require 'world_pay_api/api/payment_method'
  require 'world_pay_api/api/payment'
  require 'world_pay_api/api/pre_vault'
  

  # dependencies
  require 'faraday'
  require 'faraday_middleware'

end
