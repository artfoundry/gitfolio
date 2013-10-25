require 'json'

module Geolocator

  extend self

  def return_location_data(viewers)
      viewers
      #make_api_call if viewers. else return "no one has viewed your page"
  end

  def make_api_call(ips)

    uri_string = "some url?"
    ips.each { |ip| uri_string += "#{ip}," }
    uri = URI.parse(uri_string)
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri.request_uri)
    JSON.parse(http.request(request).body)

  end

end