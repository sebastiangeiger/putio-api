# A sample Guardfile
# More info at https://github.com/guard/guard#readme

notification :tmux,
  :display_message => true,
  :timeout => 5, # in seconds
  :default_message_format => '%s >> %s',
  # the first %s will show the title, the second the message
  # Alternately you can also configure *success_message_format*,
  # *pending_message_format*, *failed_message_format*
  :line_separator => ' > ', # since we are single line we need a separator
  :color_location => 'status-left-bg', # to customize which tmux element will change color
  :success => 'colour22'


guard 'rspec' do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})       { 'spec' }
end

guard 'cucumber' do
  watch(%r{^features/.+\.feature$})
  watch(%r{^features/support/.+$})   { 'features' }
  watch(%r{^features/step_definitions/(.+)_steps\.rb$}) { |m| Dir[File.join("**/#{m[1]}.feature")][0] || 'features' }
end
