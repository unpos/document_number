# Document Number

Document Number lets you automacally assign number sequences for your rails models.

## Installation

### Rails 3 & 4

1. Add Document Number to your `Gemfile`

    `gem 'document_number', '~> 0.0.1'`

2. Generate a migration which will add a `document_numbers` table to your database

    `bundle exec rails generate document_numbers:install`

3. Run the migration

    `bundle exec rake db:migrate`

4. Declare `has_document_number` in your model to automatic document number assignment:

```
class Invoice < ActiveRecord::Base
  has_document_number
end
```

## Available options

| Option | Description |
|--------|-------------|
| :column | The column name to update. Default value is `:number` |
| :prefix | The prefix for number |
| :start  | The start value for number. Default is 1 |
