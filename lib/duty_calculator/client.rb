require 'duty_calculator'
module DutyCalculator
  class Client
    def self.new
      ::Faraday.new(url: DutyCalculator.configuration.api_root) do |faraday|
        # middleware
        faraday.use FaradayMiddleware::FollowRedirects
        faraday.use FaradayMiddleware::EncodeJson
        # response defs
        faraday.use Faraday::Response::ParseXml
        faraday.use Faraday::Response::Mashify
        faraday.use Faraday::Response::RaiseError unless DutyCalculator.configuration.debug
        faraday.response :logger, DutyCalculator.configuration.logger

        faraday.adapter ::Faraday.default_adapter
      end
    end

    def self.api_base
      if DutyCalculator.configuration.sandbox
        return "#{DutyCalculator.configuration.api_version}/sandbox/#{DutyCalculator.configuration.api_key}"
      else
        return "#{DutyCalculator.configuration.api_version}/#{DutyCalculator.configuration.api_key}"
      end
    end
  end
end
