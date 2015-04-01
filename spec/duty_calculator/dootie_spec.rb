require 'spec_helper'

module DutyCalculator
  describe Dootie do
    context "Status Codes From API" do
      let(:params) do
        {
            from: "US",
            to: "CA",
            shipping_mode: "USPS",
            insurance: 0.0,
            currency: "USD",
            origin: "US",
            reference: "ORD12345",
            preferential_rates: 0,
            detailed_result: 1,
            incl_hs_codes: 1,
            shipping: 10.0,
            cat: ["9999999999999999999992"],
            hs: ["9019100020"],
            country_of_hs_code: ["CN"],
            desc: ["Hydrotherapy Spa Bath"],
            weight: ["1.0"],
            weight_unit: ["lb"],
            value: [ "1234.00" ],
            sku: [ "300101" ],
            qty: [ 1 ],
            commercial_importer: 0,
            classify_by: 'cat',
        }
      end
      it "returns a DutyCalculator error from code for bad api key" do
        DutyCalculator.configure do |config|
          config.api_key = ""
          config.sandbox = true
          config.debug = true
        end
        VCR.use_cassette('dootie__status_codes_from_api_1') do
          duty_calculation = DutyCalculator::Calculation.get(params)
          expect(duty_calculation.class).to eq(DutyCalculator::Dootie)
          expect(duty_calculation.message).to include('Client id is invalid or missing')
        end
      end
      it "returns a DutyCalculator error about a bad category" do
        DutyCalculator.configure do |config|
          config.api_key = 'DUTY_CALC'
          config.sandbox = true
          config.debug = true
        end
        VCR.use_cassette('dootie__status_codes_from_api_2') do
          duty_calculation = DutyCalculator::Calculation.get(params)
          expect(duty_calculation.class).to eq(DutyCalculator::Dootie)
          expect(duty_calculation.message).to include('4747')
          expect(duty_calculation.message).to include('could not be autoclassified')
        end
      end
    end
  end
end
