module Hansel
  class Record < ActiveRecord::Base
    belongs_to :recordable, polymorphic: true
    validates :fields, presence: true
  end
end
