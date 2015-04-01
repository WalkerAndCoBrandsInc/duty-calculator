# encoding: utf-8
module DutyCalculator
  class Dootie < StandardError
    def initialize(data=nil)
      @data = data
      @default_message = "[DutyCalculator][Error]: ¯\\_(ツ)_/¯"
    end

    def to_s
      msg = []
      msg << @data[:message] || @default_message
      msg << "Error Code: #{@data[:error][:code]}"
      msg << DutyCalculator::ErrorMessages.for_code(@data[:error][:code]) if @data[:error][:code]
      msg.to_s
    end
  end

  class NotImplemented < Dootie; end
end
