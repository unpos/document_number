# Document Number

[![Build Status](http://ci.7pikes.com/api/badge/github.com/7Pikes/document_number/status.svg?branch=master)](http://ci.7pikes.com/github.com/7Pikes/document_number)

Document Number lets you automacally assign number sequences for your rails models.

## Installation

### Rails 3 & 4

1. Add Document Number to your `Gemfile`

    `gem 'document_number', '~> 0.9.6'`

2. Generate a migration which will add a `document_numbers` table to your database

    `bundle exec rails generate document_numbers:install`

3. Run the migration

    `bundle exec rake db:migrate`

4. Declare `has_document_number` in your model to automatic document number assignment:

```ruby
class Invoice < ActiveRecord::Base
  has_document_number
end
```

## Configuring Document Number

Document Number has several configuration options, which you can configure, both globally and on a per-model basis:

```ruby
# config/initializers/document_number.rb
DocumentNumber.prefix = 'server/'
```

Or alternatively:

```ruby
class Invoice < ActiveRecord::Base
  has_document_number prefix: 'server/', start: 5000
end
```

Available options:

| Option | Description |
|--------|-------------|
| **column** | The column name to update. Default value is `:number` |
| **prefix** | The prefix for number |
| **start**  | The start value for number. Default is 1 |

## Usage

### Get number after initialization

Document Number automacally assigns number when you saving your model. If you want to create number just after initialization use `:with_number` attribute:

```ruby
Invoice.new with_number: true
```

### Preserve numbers

If you want to get a bunch of numbers use model method `get_numbers`:

```sh
irb(main):001>Invoice.get_numbers(3)
=> ['server/1', 'server/2', 'server/3']
```

## Contribute

Feel free to add any new features or fix bugs by creating a new pull request to this repository

### Run tests

```sh
bundle exec rspec
```
