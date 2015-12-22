require "apix/version"
require 'uri'
require 'net/http'
require 'json'

module Apix
  class << self
    attr_accessor :Q_CELL_CORE_KEY #手机归属地key

    def get_location_by_phone(phone)
      phone = phone[phone.length-11, 11]
      url = URI("http://a.apix.cn/apixlife/phone/phone?phone=#{phone}")
      http = Net::HTTP.new(url.host, url.port)

      request = Net::HTTP::Get.new(url)
      request["accept"] = 'application/json'
      request["content-type"] = 'application/json'
      request["apix-key"] = self.Q_CELL_CORE_KEY

      body = http.request(request).read_body
      puts body
      JSON.parse(body)
    end
  end
end
