class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.json :fields, default: {}
      t.json :metadata, default: {}
      t.references :recordable, polymorphic: true, index: true
      t.references :previous_record, index: true, foreign_key: { to_table: :records }
      t.datetime :created_at
    end
  end
end
