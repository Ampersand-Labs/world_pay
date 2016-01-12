module WorldPayApi
  module Api
    class PaymentMethod < Base
      def find customer_id, payment_method_id, params = {}
        @client.get("/Customers/#{customer_id}/PaymentMethod/#{payment_method_id}", params).body
      end
      
      def create customer_id, params = {}
        @client.post("/Customers/#{customer_id}/PaymentMethod", params).body
      end
      
      def update customer_id, payment_id, params = {}
        @client.put("/Customers/#{customer_id}/PaymentMethod/#{payment_id}", params).body
      end
      
      def delete customer_id, payment_id, params = {}
        @client.delete("/customers/#{customer_id}/PaymentMethod/#{payment_id}", params).body
      end
    end
  end
end
