require_relative '../models/file.rb'
require_relative '../models/directory.rb'

module PutioApi
  module Models
    class FileAndDirectoryBuilder
      def build(response)
        hash = response["files"]
        directories = hash.select{|entry| entry["content_type"] == "application/x-directory"}
        files = hash-directories
        files = files.collect {|entry| build_file(entry)}
        directories = directories.collect {|entry| build_directory(entry)}
        files + directories
      end
      private
        def build_file(hash)
          File.new(hash["name"], hash["id"])
        end
        def build_directory(hash)
          Directory.new(hash["name"], hash["id"])
        end
    end
  end
end
