class Human < ApplicationRecord
  self.table_name = :humans
  include Hansel::Recordable
end
