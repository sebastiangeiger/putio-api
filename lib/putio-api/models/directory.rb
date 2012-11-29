module PutioApi
  module Models
    class Directory < Struct.new(:name, :id)
      def is_dir?
        true
      end
    end
    class RootDirectory < Directory
      def initialize
        super("/", 0)
      end
    end
  end
end
