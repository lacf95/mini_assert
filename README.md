# MiniAssert

Fast, zero-configuration, non-dependencies testing ruby gem.

Like Minitest, but worst (in a fun way).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mini_assert'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install mini_assert

## Usage

```ruby
require 'mini_assert'

class SomeTest < MiniAssert::TestCase
  def test_some
    assert(some_exp = true)
  end
end
```

Then run your test suite:

    $ mini-assert

Or:

    $ bundle exec mini-assert

MiniAssert requires `_test.rb` file naming to load your testing files
  - valid name: `some_test.rb`
  - invalid name: `some.rb`
  - invalid name: `test_some.rb`

Also, MiniAssert requires `test_` method naming to run your tests
  - valid name: `test_some`
  - invalid name: `some`
  - invalid name: `some_test`

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/lacf95/mini_assert.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
