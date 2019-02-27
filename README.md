[![Build Status](https://travis-ci.org/rodmatos/hansel.svg?branch=master)](https://travis-ci.org/rodmatos/hansel)

# Hansel
Hansel is tiny library that tracks change to followed models, has support for both syncronous tracking and asynchronous via the different ActiveJob backends that you can plug into your Rails application.
Currently only supports for PostgreSQL databases.

## Usage
Import the concern in the models that you wish to track
```ruby
class Human < ApplicationRecord
  include Hansel::Recordable
end
```
And after every change to an `Human` record you can access its states through the `has_many :records` relationship - e.g. `Human.first.records # []`

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'hansel'
```

And then execute:
```bash
$ bundle install
```

Generate schema migration:
```bash
$ rails generate hansel:install
```

Migrate your database:
```bash
$ rails db:migrate
```

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
