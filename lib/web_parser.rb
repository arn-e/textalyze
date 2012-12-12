module WebHandler

  def self.data_from_url(url)
    query_api(url)
  end

  def self.set_connection_parameters(url, port = 80)
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, port)
    if port == 443
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    end
    request = Net::HTTP::Get.new(uri.request_uri, initheader = {"Authorization" => "token #{OAUTH_TOKEN}"})
    [request, http]
  end

  def self.query_api(url)
    request, http = self.set_connection_parameters(url, 443)
    response = http.request(request)
    json_body = JSON.parse(response.body)
  end

end
