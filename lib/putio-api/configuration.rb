require 'yaml'
module PutioApi
  class Configuration
    attr_reader :token
    def initialize(token)
      @token = token
    end
    def self.file_for(path)
      File.absolute_path(File.join(path, '.putiorc'))
    end
    def self.build(path)
      hash = YAML.load_file(file_for(path))
      new(hash[:token])
    end
    def self.init_config_file_in(path)
      content = YAML::dump(new("Enter your token here!").to_hash)
      File.open(file_for(path),'w') { |file| file.write(content) }
    end
    def to_s
      "token: #{@token}"
    end
    def to_hash
      {token: @token}
    end
  end
end
