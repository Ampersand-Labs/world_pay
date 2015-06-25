module WorldPayApi
  module Api
    class CustomerPayment < Base
      def create params = {}
        @client.post("/Customers/Payments", params).body
      end
      
      def update customer_id, params = {}
        @client.put("/customers/#{customer_id}/payments", params).body
      end
    end
  end
end
