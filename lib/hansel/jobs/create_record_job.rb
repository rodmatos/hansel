# CreateRecordJob is responsable for the creation of a new Record
class CreateRecordJob < ApplicationJob
  queue_as :default

  def perform(model, id)
    # TODO: implement
  end
end
