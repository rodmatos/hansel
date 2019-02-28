module Hansel
  module Recordable
    # CreateRecordJob is responsable for the creation of a new Record
    class CreateRecordJob < ActiveJob::Base
      queue_as :default

      def perform(model_name, id, metadata)
        model = model_name.constantize.find_by_id(id)
        Hansel::Record.create!(
          recordable: model,
          fields: serialize_model(model),
          metadata: metadata,
          previous_record: Hansel::Record.where(recordable_id: id).last
        )
        # TODO: change the way previous_record is being set, possible race conditions
      end

      def serialize_model(model)
        begin
          serializer_class = "::#{model.class.name}Serializer".constantize
          serializer = serializer_class.new(model)
          JSON.parse(serializer.to_json)
        rescue NameError
          model.attributes
        end
      end
    end
  end
end
