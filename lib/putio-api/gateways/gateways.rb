require 'uri'
require 'net/http'
require 'json'
require_relative '../models/urls.rb'

module PutioApi
  module Gateways
    class DirectoryContentsGateway
      def initialize(request_gateway, builder)
        @request_gateway = request_gateway
        @builder = builder
      end
      def get(directory)
        response = @request_gateway.get(Models::FilesListURL.new(directory))
        json = JSON.parse(response.body)
        @builder.build(json)
      end
    end
    class DownloadFileURLGateway
      def initialize(request_gateway)
        @request_gateway = request_gateway
      end
      def get(file)
        response = @request_gateway.get(Models::DownloadFileURL.new(file))
        raise "Expected the response to be a redirect was a \"#{response.class}\" instead." unless response.is_a? Net::HTTPFound
        response.get_fields('Location').first
      end
    end
    class Request
      def initialize(token)
        @token = token
      end
      def get(url_builder)
        url = url_builder.url_for(@token)
        uri = URI.parse(url)
        http = Net::HTTP.new(uri.host, uri.port)
        request = Net::HTTP::Get.new(uri.request_uri)
        http.use_ssl = true
        response = http.request(request)
      end
    end
  end
end
