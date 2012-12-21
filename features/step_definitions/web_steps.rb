require 'uri'
Then /^the output should be a URL$/ do
  assert_success(true)
  all_output.should match(URI.regexp)
  puts all_output.match(URI.regexp)[0] # Writing here because I want to manually inspect the URL
end
