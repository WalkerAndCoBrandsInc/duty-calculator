# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'duty_calculator/version'

Gem::Specification.new do |spec|
  spec.name          = "duty_calculator"
  spec.version       = DutyCalculator::VERSION
  spec.authors       = ["Thomas Hanley", "Rachel Heaton"]
  spec.email         = ["tom@walkerandcompany.com", "rachel@walkerandcompany.com"]
  spec.summary       = %q{Wrapper for dutycalculator.com}
  spec.description   = %q{API documentation http://www.dutycalculator.com/api-center/dutycalculator-api-2-1-documentation/}
  spec.homepage      = "https://github.com/tjhanley/duty-calculator"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "vcr", "~> 2.9"
  spec.add_development_dependency "webmock", "~> 1.20"
  spec.add_dependency "faraday", "~> 0.9"
  spec.add_dependency "faraday_middleware", "~> 0.9"
  spec.add_runtime_dependency "hashie", "~> 3.3"
  spec.add_runtime_dependency "multi_xml", "~> 0.5"
  spec.add_runtime_dependency "addressable", "~> 2.3"
  spec.add_runtime_dependency "faraday-detailed_logger", "~> 1.0"
end
