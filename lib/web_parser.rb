# Note : JSON is no longer being parsed in the query method
require 'uri'
require 'net/http'
require 'net/https'

module WebHandler
  def self.url_validity_check(url)
    response = query_api(url, 'head')
    # logger.info(response)
    # logger.info(response.header)
    p response
    p response.header
    response.header.message == "OK" ? true : false
  end

  def self.data_from_url(url)
    response = query_api(url, 'get')
  end

  def self.set_connection_parameters(url, request_type, port = 80)
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, port)
    if port == 443
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    end
    request_type == 'get' ? (request = Net::HTTP::Get.new(uri.request_uri)) : (request = Net::HTTP::Head.new(uri.request_uri))
    [request, http]
  end

  def self.query_api(url, request_type = 'get', port = 80)
    request, http = self.set_connection_parameters(url, request_type, port)
    response = http.request(request)
  end
end
