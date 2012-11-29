require 'aruba/cucumber'
Before do
    @aruba_timeout_seconds = 15
    @old_home = ENV["HOME"]
    ENV["HOME"] = File.absolute_path("fakehome")
    Dir.mkdir(ENV["HOME"]) unless File.directory?(ENV["HOME"])
end
After do
  ENV["HOME"] = @old_home
end
