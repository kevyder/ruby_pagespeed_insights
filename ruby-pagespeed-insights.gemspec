lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pagespeed_insights/version'

Gem::Specification.new do |spec|
  spec.name          = 'ruby-pagespeed-insights'
  spec.version       = PagespeedInsights::VERSION
  spec.authors       = ['Kevin Rodriguez']
  spec.email         = ['kyrodriguez97@gmail.com']

  spec.summary       = 'A Ruby wrapper for the PageSpeed Insights API.'
  spec.description   = 'A Ruby wrapper for Google PageSpeed Insights API.'
  spec.homepage      = 'https://github.com/kevyder/ruby_pagespeed_insights'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['homepage_uri'] = spec.homepage
    spec.metadata['source_code_uri'] = 'https://github.com/kevyder/ruby_pagespeed_insights'
  else
    raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'faraday', '~> 1.0', '>= 1.0.1'
  spec.add_runtime_dependency 'json', '~> 2.3', '>= 2.3.0'

  spec.add_development_dependency 'bundler', '~> 1.17'
  spec.add_development_dependency 'rake', '~> 12.3', '>= 12.3.3'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'simplecov', '~> 0.19.0'
  spec.add_development_dependency 'pre-commit', '~> 0.39.0'
  spec.add_development_dependency 'rubocop', '~> 0.90.0'
  spec.add_development_dependency 'rubocop-rspec', '~> 1.43', '>= 1.43.2'
end
