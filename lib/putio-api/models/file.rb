module PutioApi
  module Models
    class File < Struct.new(:name, :id)
      def is_dir?
        false
      end
    end
  end
end
