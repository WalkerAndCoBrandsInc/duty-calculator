require "duty_calculator/client"

module DutyCalculator
  class Currency
    def self.list_all
      conn = DutyCalculator::Client.new
      resp = conn.get "#{DutyCalculator::Client.api_base}/supported-currencies"
      resp.body
    end
  end
end
