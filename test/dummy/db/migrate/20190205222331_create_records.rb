class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.jsonb :fields
      t.jsonb :metadata
      t.datetime :created_at
    end
    add_index :records, :hansel_records
  end
end
