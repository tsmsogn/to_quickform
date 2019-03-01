# ToQuickform

[![Build Status](https://travis-ci.org/tsmsogn/to_quickform.svg?branch=master)](https://travis-ci.org/tsmsogn/to_quickform)
[![Maintainability](https://api.codeclimate.com/v1/badges/262bb600c07307111ee0/maintainability)](https://codeclimate.com/github/tsmsogn/to_quickform/maintainability)

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

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tsmsogn/to_quickform.
