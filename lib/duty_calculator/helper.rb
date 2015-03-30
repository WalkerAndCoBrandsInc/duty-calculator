module DutyCalculator
  module Helper
    class << self
      def iterate(h)
        h.each do |k,v|
          value = v || k
          if value.is_a?(Hash) || value.is_a?(Array)
            iterate(value)
          end
          if k == '__content__' && v.to_i
            h[k] = v.to_f
          end
        end
      end
    end
    def self.format_response(response)
      self.iterate(response)
    end
  end
end
