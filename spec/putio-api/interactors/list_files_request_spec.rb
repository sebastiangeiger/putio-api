require_relative '../../../lib/putio-api/interactors/list_files_request.rb'
require 'ostruct'
require 'vcr'

VCR.configure do |c|
    c.cassette_library_dir = 'spec/vcr_cassettes'
    c.hook_into :webmock
end

module PutioApi
  module Interactors
    describe ListFilesRequest do
      let(:config) { OpenStruct.new(token: "SU8E03NO") }
      describe "#execute" do
        let(:request) { ListFilesRequest.new(config) }
        context "when given the root folder" do
          it "should return the files and folders in it" do
            VCR.use_cassette('root-success') do
              response = request.list('/')
              response.size.should == 5
              response.collect.map(&:name).should include('The.Walking.Dead.S03E07.720p.HDTV.x264-EVOLVE.mkv')
            end
          end
        end
        context "when given a subfolder" do
          it "should return the files and folders in it" do
            VCR.use_cassette('subfolder-success') do
              response = request.list('Hell.on.Wheels.S01E08.720p.HDTV.x264-COMPULSiON/Sample')
              response.collect.map(&:name).should == ['hell.on.wheels.s01e08.720p.hdtv.x264-compulsion.sample.mkv']
            end
          end
        end
        context "when given a file in a subfolder" do
          it "should return the filename" do
            VCR.use_cassette('subfolder-file-success') do
              response = request.list('Hell.on.Wheels.S01E08.720p.HDTV.x264-COMPULSiON/Sample/hell.on.wheels.s01e08.720p.hdtv.x264-compulsion.sample.mkv')
              response.collect.map(&:name).should  == ['hell.on.wheels.s01e08.720p.hdtv.x264-compulsion.sample.mkv']
            end
          end
        end
      end
    end
  end
end
