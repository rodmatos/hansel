require_relative '../spec_helper'

RSpec.describe Human, type: :model do
  let!(:human) { Human.create(name: 'John Doe') }
  it 'includes Recordable concern' do
    expect(Human.included_modules).to include(Hansel::Recordable)
  end

  it 'has many records' do
    expect(human.records.size).to eq(1)
    expect(human.records[0]).to have_attributes(class: Hansel::Record, fields: { "id" => human.id, "name" => human.name})
  end

  it 'is a human with a record' do
    old_name = human.name
    human.update_attributes(name: 'Jane Doe')
    expect(human.records.size).to eq(2)
    expect(human.records[0]).to have_attributes(class: Hansel::Record, fields: { "id" => human.id, "name" => old_name})

    expect(human.records[1]).to have_attributes(class: Hansel::Record, fields: { "id" => human.id, "name" => human.name})
  end
end
