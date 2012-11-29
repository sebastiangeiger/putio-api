require_relative '../models/file_and_directory_builder.rb'
require_relative '../models/path_through_folders.rb'
require_relative '../gateways/gateways.rb'
require_relative '../models/urls.rb'

module PutioApi
  module Interactors
    class DownloadFileRequest
      def initialize(config)
        @config = config
      end
      def get_url(path)
        http = Gateways::Request.new(@config.token)
        directory_contents_gateway = Gateways::DirectoryContentsGateway.new(http,Models::FileAndDirectoryBuilder.new)
        file = Models::PathThroughFolders.new(directory_contents_gateway).retrieve(path)
        raise "#{file.name} is a directory. Can only download files." if file.is_dir?
        Gateways::DownloadFileURLGateway.new(http).get(file)
      end
    end
  end
end
