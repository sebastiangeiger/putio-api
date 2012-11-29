require_relative '../../../lib/putio-api/models/file_and_directory_builder.rb'
module PutioApi
  module Models
    describe FileAndDirectoryBuilder do
      describe ".build" do
        let(:builder) { FileAndDirectoryBuilder.new }
        context "when given a directory" do
         it "builds that directory" do
           files = builder.build({"files" => [{"name" => "some_name", "id" => "13", "content_type" => "application/x-directory" }]})
           files.size.should == 1
           files.first.name.should == "some_name"
           files.first.id.should == "13"
         end
        end
        context "when given a file" do
         it "builds that file" do
           files = builder.build({"files" => [{"name" => "some_name", "id" => "13", "content_type" => "video/avi" }]})
           files.size.should == 1
           files.first.name.should == "some_name"
           files.first.id.should == "13"
         end
        end
      end
    end
  end
end
