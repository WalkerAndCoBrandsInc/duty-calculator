require "yaml"

require "duty_calculator"

module DutyCalculator
  class Configuration
    attr_accessor :api_root, :api_version, :api_key, :api_base, :sandbox, :debug

    def initialize
      defaults = load_defaults
      @api_root = defaults[:api_root]
      @api_version = defaults[:api_version]
      @sandbox = defaults[:sandbox]
      @debug = defaults[:debug]
    end

    private
    def load_defaults
      YAML.load_file(File.join(File.dirname(__FILE__),'..','config','defaults.yml'))
    end
  end
end
