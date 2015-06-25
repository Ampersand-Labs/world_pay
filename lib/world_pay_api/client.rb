require 'openssl'

module WorldPayApi
  class Client

    API_VERSION = 'v1'
    DEFAULT_SERVERS = {
        :sandbox => 'https://gwapi.demo.securenet.com',
        :live => 'https://gwapi.demo.securenet.com'
      }

    attr_reader :secure_key, :server, :connection

    def initialize(server, secure_key = nil)
        @secure_key = secure_key
        @server = DEFAULT_SERVERS[server]

        @connection = Faraday.new({ url: @server, ssl: { verify: false }, request: {} }) do |builder|
          # response
          builder.use Faraday::Response::RaiseError
          builder.response :json
          builder.adapter Faraday.default_adapter

          # request
          builder.request :multipart
          builder.request :json
        end
    end

    def customer
      WorldPayApi::Api::Customer.new(self)
    end
    
    def customer_payment
      WorldPayApi::Api::CustomerPayment.new(self)
    end
    
    def payment_method
      WorldPayApi::Api::PaymentMethod.new(self)
    end
    
    def payment
      WorldPayApi::Api::Payment.new(self)
    end

    def get(path, options = {})
      request(:get, parse_query_and_convenience_headers(path, options))
    end

    def post(path, options = {})
      request(:post, parse_query_and_convenience_headers(path, options))
    end

    def delete(path, options = {})
      request(:delete, parse_query_and_convenience_headers(path, options))
    end

    private

    def parse_query_and_convenience_headers(path, options)
      raise 'Path can not be blank.' if path.to_s.empty?
      opts = { body: options[:body] }
      opts[:url]    = path
      opts[:method] = options[:method] || :get
      opts[:timeout] = options[:timeout] || 20
      opts.tap {|p| p[:params] = (options[:params] || {})}
    end

    def request(method, options = {})
      url     = "/api/" + options.fetch(:url)
      params  = options[:params] || {}
      body    = options[:body].nil? ? nil : options[:body]
      headers = options[:headers]
      timeout = options[:timeout] || 20
      
      @connection.send(method) do |req|
        req.url(url)
        req.params.merge!(params)
        req.body = body.nil? ? nil : body.to_json
        req.options.timeout = timeout
        req.headers['Content-Type'] = 'application/json'
        req.headers['Authorization'] = 'Basic ' + @secure_key
      end
    end
  end
end
