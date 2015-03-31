require "duty_calculator/version"
require "duty_calculator/configuration"
require "duty_calculator/currency"
require "duty_calculator/category"
require "duty_calculator/calculation"
require "duty_calculator/response"
require "duty_calculator/error_messages"

require "faraday"
require "faraday_middleware"
require "hashie"

module DutyCalculator
  class << self
    attr_writer :configuration

    def configure
      yield(configuration)
    end

    def configuration
      @configuration ||= Configuration.new
    end

    def reset
      @configuration = Configuration.new
    end
  end
end
