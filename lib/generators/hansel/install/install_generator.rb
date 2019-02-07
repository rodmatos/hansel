require 'rails/generators'
require 'rails/generators/active_record'

module Hansel
  # Generator for the Hansel::Record model
  class InstallGenerator < ::Rails::Generators::Base
    include ::Rails::Generators::Migration

    source_root File.expand_path('templates', __dir__)

    def self.next_migration_number(dirname)
      ::ActiveRecord::Generators::Base.next_migration_number(dirname)
    end

    def add_hansel_migration
      migration_template(
        'create_records.rb.erb',
        'db/migrate/create_records.rb',
        migration_version: migration_version
      )
    end

    def migration_version
      "[#{ActiveRecord::VERSION::MAJOR}.#{ActiveRecord::VERSION::MINOR}]"
    end
  end
end
