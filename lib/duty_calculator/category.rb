require "duty_calculator/client"

module DutyCalculator
  class Category
    def self.list_all
      conn = DutyCalculator::Client.new
      resp = conn.get "#{DutyCalculator::Client.api_base}/categories"
      resp.body
    end
  end
end
