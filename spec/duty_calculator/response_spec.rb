require 'spec_helper'

module DutyCalculator
  describe Response do
    context ".initialize" do
      it "coerces some uglyness" do
        hash = {
            "string_value" => "stringerific",
            "__content__" => "should_be_string",
            "nested_integer" => {
                "__content__" => "1223"
            },
            "nested_zero" => {
                "__content__" => "0"
            }
        }
        response = DutyCalculator::Response.new(hash)
        expect(response["string_value"].class).to eq(String)
        expect(response.keys.include?("value")).to eq(true)
        expect(response.keys.include?("__content__")).to_not eq(true)
        expect(response["value"].class).to eq(String)
        expect(response["nested_integer"]["value"].class).to eq(Float)
        expect(response["nested_zero"]["value"].class).to eq(Float)
      end
    end
  end
end
