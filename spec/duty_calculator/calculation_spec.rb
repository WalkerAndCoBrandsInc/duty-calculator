require 'spec_helper'

module DutyCalculator
  describe Configuration do
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

          expect(transformed["from"]).to eq(params[:from])
          expect(transformed["cat"]).to eq({ 0 => params[:cat].first })
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

          expect(transformed["from"]).to eq(params[:from])
          expect(transformed["cat"]).to eq({ 0 => params[:cat].first, 1 => params[:cat].last })
        end
      end
    end
  end
end
