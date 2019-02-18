require 'active_support/concern'

# Include Recordable concern in the models that you wish to track
module Hansel
  module Recordable
    extend ActiveSupport::Concern

    included do
      has_many :records, as: :recordable, class_name: 'Hansel::Record'
      after_commit do
        CreateRecordJob.perform_later(self.class.name, id, {})
      end
    end
  end
end
