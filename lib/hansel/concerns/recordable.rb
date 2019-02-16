require 'active_support/concern'

# Include Recordable concern in the models that you wish to track
module Hansel
  module Recordable
    extend ActiveSupport::Concern

    included do
      has_many :records, as: :recordable
      after_commit do
        CreateRecordJob.perform_later(class_name, id)
      end
    end
  end
end
