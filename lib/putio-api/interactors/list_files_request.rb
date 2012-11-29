require_relative '../models/file_and_directory_builder.rb'
require_relative '../models/path_through_folders.rb'
require_relative '../gateways/gateways.rb'

module PutioApi
  module Interactors
    class ListFilesRequest
      def initialize(config)
        @config = config
      end
      def list(path)
        directory_contents_gateway = Gateways::DirectoryContentsGateway.new(Gateways::Request.new(@config.token),Models::FileAndDirectoryBuilder.new)
        result = Models::PathThroughFolders.new(directory_contents_gateway).retrieve(path)
        if result.is_dir?
          directory_contents_gateway.get(result)
        else
          [result]
        end
      end
    end
  end

end
