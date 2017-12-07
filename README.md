# ToQuickform [![Build Status](https://travis-ci.org/tsmsogn/to_quickform.svg?branch=master)](https://travis-ci.org/tsmsogn/to_quickform)

ToQuickform creates some QuickForm codes from given data.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'to_quickform'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install to_quickform

## Usage

### Parsing an YAML/JSON 

```ruby
generator = ToQuickform.YAML(yaml)
generator = ToQuickform.JSON(json)
```

#### YAML format:

See https://github.com/tsmsogn/to_quickform/blob/master/spec/fixtures/sample.yaml

#### JSON format:

See https://github.com/tsmsogn/to_quickform/blob/master/spec/fixtures/sample.json

### Creating setDefaults() codes

```ruby
generator.to_set_defaults
```

Output https://github.com/tsmsogn/to_quickform/blob/master/spec/fixtures/set_defaults.txt

### Creating addElement()/createElement() codes

```ruby
generator.to_create_element
```

Output https://github.com/tsmsogn/to_quickform/blob/master/spec/fixtures/create_element.txt

### Creating addRule()/addGrouoRule() codes

```ruby
generator.to_add_rule
```

Output https://github.com/tsmsogn/to_quickform/blob/master/spec/fixtures/add_rule.txt

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tsmsogn/to_quickform.
