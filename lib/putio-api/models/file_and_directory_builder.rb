module PutioApi
  module Models
    class FileAndDirectoryBuilder
      def build(response)
        # hash = response["files"]
        # directories = hash.select{|entry| entry["content_type"] == "application/x-directory"}
        # files = hash-directories
        # files = files.collect {|entry| build_file(entry)}
        # directories = directories.collect {|entry| build_directory(entry)}
        # files + directories
        response["files"].map{|entry| build_entry(entry)}
      end
      private
        # def build_file(hash)
        #   File.new(hash["name"], hash["id"])
        # end
        # def build_directory(hash)
        #   Directory.new(hash["name"], hash["id"])
        # end
        def build_entry(hash)
          FileOrDirectory.new(hash["name"], hash["id"], hash["content_type"])
        end
    end
    class FileOrDirectory < Struct.new(:name, :id, :content_type)
      def is_dir?
        content_type == "application/x-directory"
      end
    end
    class RootDirectory < FileOrDirectory
      def initialize
        super("/", 0)
      end
      def is_dir?
        true
      end
    end

  end
end
