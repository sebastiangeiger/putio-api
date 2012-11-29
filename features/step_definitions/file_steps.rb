
Then /^the file "(.*?)" should exist in the current directory$/ do |file|
  File.file?(file).should == true
end
