module WorldPayApi
  module Api
    class Customer < Base
      def find customer_id, params = {}
        @client.get("/Customers/#{customer_id}", params).body
      end
      
      def create params = {}
        @client.post("/Customers", params).body
      end
      
      def update customer_id, params = {}
        @client.put("/Customers/#{customer_id}", params).body
      end
    end
  end
end
