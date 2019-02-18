class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.jsonb :fields, default: {}
      t.jsonb :metadata, default: {}
      t.datetime :created_at
      t.references :recordable, polymorphic: true, index: true
    end
  end
end
