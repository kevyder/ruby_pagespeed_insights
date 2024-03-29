lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pagespeed_insights/version'

Gem::Specification.new do |spec|
  spec.name          = 'ruby_pagespeed_insights'
  spec.version       = PagespeedInsights::VERSION
  spec.authors       = ['Kevin Rodriguez']
  spec.email         = ['kyrodriguez97@gmail.com']

  spec.summary       = 'A Ruby wrapper for Google PageSpeed Insights API.'
  spec.description   = 'A Ruby wrapper for Google PageSpeed Insights API.'
  spec.homepage      = 'https://github.com/kevyder/ruby_pagespeed_insights'
  spec.license       = 'MIT'
  spec.required_ruby_version = '>= 2.6'

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

  spec.add_runtime_dependency 'faraday', '~> 2.4'
  spec.add_runtime_dependency 'json', '~> 2.6', '>= 2.6.2'

  spec.add_development_dependency 'bundler', '~> 2.3', '>= 2.3.19'
  spec.add_development_dependency 'rake', '~> 13.0', '>= 13.0.6'
  spec.add_development_dependency 'rspec', '~> 3.11'
end
