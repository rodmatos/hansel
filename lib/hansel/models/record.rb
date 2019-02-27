module Hansel
  class Record < ActiveRecord::Base
    belongs_to :recordable, polymorphic: true
    belongs_to :previous_record, class_name: "Hansel::Record"
    validates :fields, presence: true
  end
end
