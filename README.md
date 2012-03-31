# WhoGrantSig

A really simple way to authenticate requests based on a Webfinger and RSA keypairs


You can think of this as an authenticity token on sterioids.  That is, given you speak webfinger and said webfinger profile has a public key for the user, WhoGrantSig can make authenticated, verified requests, which the destination server can verify, without granting explicit prior authorization.

## Possible Use cases
  1. Authenticating CORS get requests to get private data in the browser.
  2. Use it instead of API tokens(YAY), or explicit Oauth pre-registration (might not be a good idea, but could work)

##motivation
  I wanted to extract some ideas from my brain into a really simple gem that I could play with.  This is in no way battle tested, and most likely is pretty naive, but it is easy to grok the fundamental power

  In some regards, this is just me collapsing some of my own thinking with prior art, so thanks to projects like diaspora, browserid, from-header pubsubhubub authorization, salmon/magic signatures, oauth for giving me idea fodder.


## Installation

Add this line to your application's Gemfile:

    gem 'who_grant_sig'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install who_grant_sig

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
