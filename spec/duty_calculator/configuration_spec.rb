require 'spec_helper'

module DutyCalculator
  describe Configuration do
    let(:api_root) {'http://www.dutycalculator.com/'}
    let(:api_version) {'api2.1'}
    let(:sandbox) {'true'}
    let(:debug) {'true'}

    describe 'has defaults' do
      it 'should default value' do
        expect(Configuration.new.api_root).to eq(api_root)
        expect(Configuration.new.api_version).to eq(api_version)
      end
    end
    describe 'can override defaults' do
      it 'can set value' do
        config = Configuration.new
        config.api_root = api_root
        config.api_version = api_version
        config.sandbox = sandbox
        config.debug = debug

        expect(config.api_root).to eq(api_root)
        expect(config.api_version).to eq(api_version)
        expect(config.sandbox).to eq(sandbox)
        expect(config.debug).to eq(debug)
      end
    end
  end
end
