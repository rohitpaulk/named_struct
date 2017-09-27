# NamedStruct

[![Travis](https://img.shields.io/travis/rohitpaulk/named_struct.svg)](https://travis-ci.org/rohitpaulk/named_struct) [![Gem](https://img.shields.io/gem/v/namedstruct.svg)](https://rubygems.org/gems/namedstruct)

`NamedStruct` is a replacement for Ruby's built-in
[`Struct`](https://ruby-doc.org/core-2.4.0/Struct.html) that accepts keyword
arguments instead of positional arguments.

## Why?

```ruby
# bad
p = Point.new(1, 2)

# good
p = Point.new(x: 1, y: 2)
```

## You probably don't need this

You could just add this file to your project and be done:

```ruby
class NamedStruct < Struct
  def initialize(**kwargs)
    super(*members.map{|k| kwargs[k] })
  end
end
```

I found myself adding this class to every Ruby project I worked on, that's
where a gem comes in handy.

## Installation

`NamedStruct` is available as a [RubyGem](https://rubygems.org/). To install,
run:

```
gem install namedstruct
```

If you're using [Bundler](http://bundler.io/), add this to your Gemfile:

```ruby
gem 'namedstruct'
```

## Usage

Declaring a struct is the same as with
[Struct](https://ruby-doc.org/core-2.4.0/Struct.html):

```ruby
class Point < NamedStruct.new(:x, :y)
end
```

The only difference is in instantiating an object of the class:

```ruby
# When using Ruby's struct:
p = Point.new(1, 2)

# When using NamedStruct:
p = Point.new(x: 1, y: 2)
```

Any arguments that are not provided will have a value of `nil` by default.

```ruby
p = Point.new(x: 1)
p.x # => 1
p.y # => nil
```

Passing in an argument that isn't a member of the struct will raise an
`ArgumentError`

```ruby
p = Point.new(invalid_arg: something) # => Raises `ArgumentError`
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`rake test` to run the tests. You can also run `bin/console` for an interactive
prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release`, which will create a git tag for the version, push
git commits and tags, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/rohitpaulk/named_struct. This project is intended to be a
safe, welcoming space for collaboration, and contributors are expected to
adhere to the [Contributor Covenant](http://contributor-covenant.org) code of
conduct.

## License

The gem is available as open source under the terms of the [MIT
License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the NamedStruct project’s codebases, issue trackers,
chat rooms and mailing lists is expected to follow the [code of
conduct](https://github.com/[USERNAME]/named_struct/blob/master/CODE_OF_CONDUCT.md).
