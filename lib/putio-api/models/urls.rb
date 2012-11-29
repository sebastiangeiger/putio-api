module PutioApi
  module Models
    class GenericURL
      def initialize(directory)
        @id = directory.id
      end
      def url_for(token)
        @token = token
        url
      end
    end
    class FilesListURL < GenericURL
      def url
        "https://api.put.io/v2/files/list?parent_id=#{@id}&oauth_token=#{@token}"
      end
    end
    class DownloadFileURL < GenericURL
      def url
        "https://api.put.io/v2/files/#{@id}/download?oauth_token=#{@token}"
      end
    end
  end
end
