module WorldPayApi
  module Api
    class Payment < Base
      def verify params = {}
        @client.post("/Payments/Verify", params).body
      end
      
      def authorize params = {}
        @client.post("/Payments/Authorize", params).body
      end
      
      def charge params = {}
        @client.post("/Payments/Charge", params).body
      end
    end
  end
end
