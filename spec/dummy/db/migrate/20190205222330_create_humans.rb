class CreateHumans < ActiveRecord::Migration[5.2]
  def change
    create_table :humans do |t|
      t.string :name
    end
  end
end
