# OmniAuth ConstantContact

This gem is an OmniAuth 1.0 Strategy for the [ConstantContact API](http://community.constantcontact.com/t5/Documentation/API-Documentation/ba-p/25125)

It supports the OmniAuth REST API which uses OAuth 1.0a.

## Usage

Add the strategy to your `Gemfile` alongside OmniAuth:

```ruby
gem 'omniauth'
gem 'omniauth-constantcontact'
```

Then integrate the strategy into your middleware:

```ruby
use OmniAuth::Builder do
  provider :constantcontact, ENV['CC_KEY'], ENV['CC_SECRET']
end
```

In Rails, you'll want to add to the middleware stack:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :constantcontact, ENV['CC_KEY'], ENV['CC_SECRET']
end
```

You will have to put in your consumer key and secret, which you can find at http://community.constantcontact.com/t5/Documentation/API-Keys/ba-p/25015

For additional information, refer to the [OmniAuth wiki](https://github.com/intridea/omniauth/wiki).


## Copyright

Copyright (c) 2012 Caleb Clark. See [LICENSE](https://github.com/calebclark/omniauth-constantcontact/blob/master/LICENSE.md) for details.