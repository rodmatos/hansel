module Hansel
  module Recordable
    # CreateRecordJob is responsable for the creation of a new Record
    class CreateRecordJob < ActiveJob::Base
      queue_as :default

      def perform(model_name, id, metadata)
        model = model_name.constantize.find_by_id(id)
        Hansel::Record.create!(
          recordable: model,
          fields: model.attributes,
          metadata: metadata,
        )
      end
    end
  end
end
