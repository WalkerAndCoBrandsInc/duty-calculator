require "hashie"
module DutyCalculator
  class Response < Hash
    include ::Hashie::Extensions::Coercion
    coerce_value Hash, Response

    def initialize(hash = {})
      super
      hash.each_pair do |k,v|
        if k == '__content__' && v.to_s == 0.to_s
          self['value'] = v.to_f
        elsif k == '__content__' && v.to_i > 0
          self['value'] = v.to_f
        elsif k == '__content__'
          self['value'] = v
        else
          self[k] = v
        end
      end
    end
  end
end
