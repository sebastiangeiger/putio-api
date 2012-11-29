require_relative '../../../lib/putio-api/interactors/download_file_request.rb'
require 'vcr'

VCR.configure do |c|
    c.cassette_library_dir = 'spec/vcr_cassettes'
    c.hook_into :webmock
end

module PutioApi
  module Interactors
    describe DownloadFileRequest do
      let(:config) { OpenStruct.new(token: "SU8E03NO") }
      describe "#execute" do
        let(:request) { DownloadFileRequest.new(config) }
        context "when given the root folder" do
          it "should return the files and folders in it" do
            VCR.use_cassette('download-file-success') do
              url = request.get_url("Uploading to Piratebay- The Complete Guide.txt")
              url.should == "https://frc.put.io/download/49524094?tunnel=1&token=7e69148e39f811e2a1e900248126f0ef&storage=s10&attachment=1"
            end
          end
        end
      end
    end
  end
end
