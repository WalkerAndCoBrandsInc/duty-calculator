require "duty_calculator/client"
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
    end

    def self.get(params={})
      qs = params.collect do |k,v|
            if v.kind_of?(Array)
              memo = ""
              v.each_with_index do |value, index|
                memo << "#{k}[#{index}]=#{value}"
                memo << "&" if v.size > (index+1)
              end
              memo
            else
              "#{k}=#{v}"
            end
          end
      conn = DutyCalculator::Client.new
      resp = conn.get "#{DutyCalculator::Client.api_base}/calculation?#{qs.join('&')}"
      raise Exception, "Duty Calculator Error: #{DutyCalculator::ErrorMessages.for_code(resp.body["error"]["code"])}" if resp.body["error"]
      raise Exception, "HTTP Status Code #{resp.status}" if resp.status.to_i != 200
      return resp.body
    end
  end
end
