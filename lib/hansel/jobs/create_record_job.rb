# CreateRecordJob is responsable for the creation of a new Record
class CreateRecordJob < ApplicationJob
  queue_as :default

  def perform(model_name, id, metadata)
    model = model_name.constantize.find_by_id(id)
    Hansel::Record.create(
      recoardable: model,
      attributes: model.attributes,
      metadata: metadata
    )
  end
end
