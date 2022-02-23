require 'net/http'
class Communication::RestClient
  def initialize; end

  def get(url, headers = {})
    uri = URI(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true if url.include? 'https'

    request = Net::HTTP::Get.new(uri)
    headers.each { |key, value| request[key] = value }

    response = http.request request
  end

  def post(url, headers = {}, body)
    uri = URI(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true if url.include? 'https'

    request = Net::HTTP::Post.new(uri)
    headers.each { |key, value| request[key] = value }
    request.body = body.to_json if body.present?

    response = http.request(request)
  end
end
