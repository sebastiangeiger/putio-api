Given /^a configuration file exists in my HOME directory with:$/ do |file_contents|
  path = File.join(ENV["HOME"],'.putiorc')
  File.open(path,"w") do |file|
    file.write(file_contents)
  end
end

Given /^there is no configuration file in my HOME directory$/ do
  path = File.join(ENV["HOME"],'.putiorc')
  File.delete(path) if File.exists?(path)
end

Given /^a valid configuration file exists$/ do
  path = File.join(ENV["HOME"],'.putiorc')
  File.open(path,'w') {|file| file.write(YAML.dump({token: "SU8E03NO"}))}
end

Then /^the configuration file in my HOME directory says:$/ do |string|
  path = File.join(ENV["HOME"],'.putiorc')
  content = []
  file = File.open(path) {|file| content << file.read}
  content = content.first
  content.strip.should == string.strip
end
