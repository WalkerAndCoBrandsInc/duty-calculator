require "duty_calculator/client"
require "duty_calculator/response"
require "duty_calculator/dootie"
require "addressable/uri"
module DutyCalculator
  class Calculation
    class << self
      def validate_params(params)
        required = %w{from to shipping_mode shipping
                      insurance currency preferential_rates detailed_result incl_hs_codes cat
                      hs country_of_hs_code desc
                      sku value weight qty origin reference}
        msg = []
        required.each do |r|
          # ensure keys are strings
          msg << r unless params.inject({}){|memo,(k,v)| memo[k.to_s] = v; memo}.has_key?(r)
        end
        raise ArgumentError, "Missing arguments from hash #{msg.to_s}" if msg.size >= 1
        return params
      end

      def transform_params(params)
        params.inject({}) do |transformed, key_value|
          k = key_value.first
          v = key_value.last
          if v.kind_of?(Array)
            transformed[k] = {}
            v.each_with_index do |value, index|
              transformed[k][index] = value
            end
          else
            transformed[k] = v
          end
          transformed
        end
      end
    end

    def self.get(params={})
      transformed_params = transform_params(validate_params(params))
      # initialize connection
      conn = DutyCalculator::Client.new

      resp = conn.get "#{DutyCalculator::Client.api_base}/calculation", transformed_params
      hashed_resp = DutyCalculator::Response.new(resp.to_hash)
      resp = Hashie::Mash.new(hashed_resp)

      if resp.body["error"]
        return DutyCalculator::Dootie.new({message: "[DutyCalculator][Error]:", error: resp.body["error"]})
      end

      resp.body.duty_calculation
    end
  end
end
