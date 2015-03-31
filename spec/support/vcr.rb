require 'vcr'
require 'webmock'

VCR.configure do |c|
  c.cassette_library_dir  = File.join(ABS_PATH, "spec", "vcr")
  c.hook_into :webmock
  c.ignore_hosts '127.0.0.1', 'localhost'
end

RSpec.configure do |c|
  c.treat_symbols_as_metadata_keys_with_true_values = true
  c.around(:each, :vcr) do |example|
    name = example.metadata[:full_description].split(/\s+/, 2).join("/").underscore.gsub(/[^\w\/]+/, "_")
    VCR.use_cassette( name, :record => :new_episodes, :match_requests_on => [:query] ) { example.call }
  end
end
