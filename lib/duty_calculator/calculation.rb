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

=begin
# https://docs.google.com/a/walkerandcobrands.com/document/d/16e_lh7MIjLGYvS_qZL7pUzOvTVte-cqTnr4jGo_VtIM/pub
# from={ISO  alpha-3 country code or alpha-2 country code} \
# &to={ISO  alpha-3 country code or alpha-2 country code} \
# &province={ISO alpha-2 province code of ‘importing to’ country (only required for Canada and Brazil)} \
# &shipping_mode={shipping mode} \
# &commercial_importer={importer status (only required for Russia)} \
# &imported_wt={total weight of products imported during the month (only required for Russia)} \
# &imported_value={total value of products imported during the month (only required for Russia)} \
# &classify_by={items classification identifier} \
# &cat[0]={item ID or category ID} \
# &hs[0]={item HS code} \
# &country_of_hs_code[0]={ISO  alpha-3 country code or alpha-2 country code} \
# &desc[0]={product description} \
# &sku[0]={item sku } \
# &value[0]={value per one item} \
# &weight[0]={weight of one item} \
# &qty[0]={item quantity} \
# &origin[0]={ISO alpha-3 country code or alpha-2 country code} \
# &reference[0]={product reference}  \
# &shipping={shipping cost} \
# &insurance={cost of insurance} \
# &currency={ISO currency code} \preferential
# &output_currency={ISO currency code} \
# &preferential_rates={1 to apply FTA and preferential rates, 0 to ignore FTA and preferential rates} \
# &detailed_result={1 for detailed result, 0 for short result} \
# &incl_hs_codes={include HS code for each item in response}
#
=end
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
      request = "#{DutyCalculator::Client.api_base}/calculation?#{qs.join('&')}"
      raise Exception, "Duty Calculator Error: #{DutyCalculator::ErrorMessages.for_code(resp.body["error"]["code"])}" if resp.body["error"]
      raise Exception, "HTTP Status Code #{resp.status}" if resp.status.to_i != Net::HTTPOK
      return resp.body
    end
  end
end
