# Ruby Pagespeed Insights

[![Gem Version](https://badge.fury.io/rb/ruby_pagespeed_insights.svg)](https://rubygems.org/gems/ruby_pagespeed_insights)
[![Coverage Status](https://coveralls.io/repos/github/kevyder/ruby_pagespeed_insights/badge.svg?branch=master)](https://coveralls.io/github/kevyder/ruby_pagespeed_insights?branch=master) 
[![Gem](https://img.shields.io/gem/dt/ruby_pagespeed_insights)](https://rubygems.org/gems/ruby_pagespeed_insights) 
![Libraries.io dependency status for GitHub repo](https://img.shields.io/librariesio/github/kevyder/ruby_pagespeed_insights)

A Ruby wrapper for Google PageSpeed Insights API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruby_pagespeed_insights'
```

And then execute:

```bash
 bundle
```

Or install it yourself as:

```bash
 gem install ruby_pagespeed_insights
```

## Usage

Once installed, you have to get your `API key` in the [Google Developers Console](https://developers.google.com/speed/docs/insights/v5/get-started) and then you can start to using the library.

### [API Version 5](https://developers.google.com/speed/docs/insights/v5/reference/pagespeedapi/runpagespeed)

```ruby
require 'pagespeed_insights'

request = PagespeedInsights::V5.new(
  url: 'http://site.com',
  key: 'your api key',
  strategy: 'desktop',
  categories: ['seo', 'pwa']
)

response = request.results
response.status   # response code status
response.headers  # response headers
response.body     # response body content
```

param      | default value | allowed values                                                 | optional?
-----------| ------------- | -------------------------------------------------------------- | ---------
url        | `none`        |                                                                | `false`
key        | `none`        |                                                                | `false`
strategy   | `none`        | `desktop`, `mobile`                                            | `true`
categories | `none`        | `accessibility`, `best-practices`, `performance`, `pwa`, `seo` | `true`

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at <https://github.com/kevyder/ruby_pagespeed_insights>. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Ruby Pagespeed Insights project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/kevyder/ruby_pagespeed_insights/blob/master/CODE_OF_CONDUCT.md).
