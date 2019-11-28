# ActivePattern

[![CircleCI](https://circleci.com/gh/kokuyouwind/active_pattern.svg?style=svg)](https://circleci.com/gh/kokuyouwind/active_pattern)

F# like ActivePattern in ruby pattern matching

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'active_pattern'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install active_pattern

## Usage

```ruby
module FZPattern
  extend ActivePattern::Context[Integer]
  FizzBuzz = pattern { self % 15 == 0 }
  Fizz     = pattern { self %  3 == 0 }
  Buzz     = pattern { self %  5 == 0 }
  Number   = pattern { [self] }
end

def fizzbuzz(n)
  case n
  in FZPattern::FizzBuzz;   :FizzBuzz
  in FZPattern::Fizz;       :Fizz
  in FZPattern::Buzz;       :Buzz
  in FZPattern::Number[n];  n
  end
end

fizzbuzz(1) # => 1
fizzbuzz(3) # => :Fizz
fizzbuzz(5) # => :Buzz
fizzbuzz(15) # => :FizzBuzz
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kokuyouwind/active_pattern.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
