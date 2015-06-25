module WorldPayApi::Api::RestUtils

  private 

    DEFAULT_SERVERS = {
        :sandbox => 'gwapi.demo.securenet.com/api/',
        :live => 'gwapi.demo.securenet.com/api/'
      }

    def connection(server)
      @conn ||= Faraday.new(:url => 'http://#{DEFAULT_SERVERS[server]}') do |faraday|
        faraday.request  :url_encoded             # form-encode POST params
        faraday.response :logger                  # log requests to STDOUT
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end
    end

    def perform_get path, params={}
      perform_request :get, path, params
    end


    def perform_request(request_method, path, params = {})
      connection.get path, options
    end


end