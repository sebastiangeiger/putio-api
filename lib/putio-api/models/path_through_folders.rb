module PutioApi
  module Models
    class PathThroughFolders
      def initialize(directory_contents_gateway)
        @directory_contents_gateway = directory_contents_gateway
      end
      def retrieve(path)
        retrieve_helper( Models::RootDirectory.new, path.split("/").reject{|e| e.empty?} )
      end
      private
        def retrieve_helper(current_folder, to_visit)
          if to_visit.empty?
            current_folder
          else
            children = @directory_contents_gateway.get(current_folder)
            next_directory_name = to_visit.shift
            candidates = children.select{|dir| dir.name == next_directory_name}
            raise "Could not find \"#{next_directory_name}\" in \"#{current_folder.name}\"" if candidates.empty?
            retrieve_helper( candidates.first, to_visit )
          end
        end
    end
  end
end
