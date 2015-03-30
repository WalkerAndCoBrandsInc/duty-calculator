require 'spec_helper'

module DutyCalculator
  describe Calculation do
    describe ".transform_params" do
      context "for a single product" do
        let(:params) do
          {
            from: "US",
            to: "CA",
            shipping_mode: "USPS",
            insurance: 0.0,
            currency: "USD",
            cat: [ "1234.00" ],
            hs: [ "CA" ],
            sku: [ "300101" ],
            qty: [ 1 ]
          }
        end

        it "makes a hash with numerical index keys for array values" do
          transformed = DutyCalculator::Calculation.transform_params(params)

          expect(transformed[:from]).to eq(params[:from])
          expect(transformed[:cat]).to eq({ 0 => params[:cat].first })
        end
      end

      context "for multiple products" do
        let(:params) do
          {
            from: "US",
            to: "CA",
            shipping_mode: "USPS",
            insurance: 0.0,
            currency: "USD",
            cat: [ "1234.00", "5678.00" ],
            hs: [ "CA", "CA" ],
            sku: [ "300101", "300102" ],
            qty: [ 1, 2 ]
          }
        end

        it "makes a hash with numerical index keys for array values" do
          transformed = DutyCalculator::Calculation.transform_params(params)

          expect(transformed[:from]).to eq(params[:from])
          expect(transformed[:cat]).to eq({ 0 => params[:cat].first, 1 => params[:cat].last })
        end
      end
    end
    describe ".get" do
      before do
        DutyCalculator.configure do |config|
          config.api_key = "DUTY_CALC"
          config.sandbox = true
          config.debug = true
        end
      end
      context "for a single product" do
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
              cat: ["522"],
              hs: ["9019100020", "9019100020"],
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
        it 'makes a nice hash' do
          VCR.use_cassette('calculate__nice_hash_for_single_product') do
            response = DutyCalculator::Calculation.get(params)
            expect(response["duty_calculation"]["item"]["id"].class).to eq(String)
            expect(response["duty_calculation"]["item"]["hs_code"].class).to eq(String)
            expect(response["duty_calculation"]["item"]["sales_tax"]["amount"]["__content__"].class).to eq(Float)
          end
        end
      end
      context "for multiple products" do
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
              cat: ["522","522"],
              hs: ["9019100020", "9019100020"],
              country_of_hs_code: ["CN", "DE"],
              desc: ["Hydrotherapy Spa Bath", "Hydrotherapy Spa Bath"],
              weight: ["1.0", "2.0"],
              weight_unit: ["lb", "lb"],
              value: [ "1234.00", "2345.67" ],
              sku: [ "300101", "300102" ],
              qty: [ 1, 2 ],
              commercial_importer: 0,
              classify_by: 'cat',
          }
        end

        it 'makes a nice hash' do
          VCR.use_cassette('calculate__nice_hash_for_multiple_products') do
            response = DutyCalculator::Calculation.get(params)
            response["duty_calculation"]["item"].each do |item|
              expect(item["id"].class).to eq(String)
              expect(item["hs_code"].class).to eq(String)
              expect(item["sales_tax"]["amount"]["__content__"].class).to eq(Float)
            end
          end
        end
      end
    end
  end
end
