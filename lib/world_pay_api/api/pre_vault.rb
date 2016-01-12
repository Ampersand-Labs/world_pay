module WorldPayApi
  module Api
    class PreVault < Base 
      def create params = {}
        @client.post("/PreVault/Card", params).body
      end
    end
  end
end
