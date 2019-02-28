require_relative '../spec_helper'

RSpec.describe Human, type: :model do
  let!(:human) { Human.create(name: 'John Doe') }
  it 'includes Recordable concern' do
    expect(Human.included_modules).to include(Hansel::Recordable)
  end

  it 'has many records' do
    expect(human.records.size).to eq(1)
    expect(human.records.last).to have_attributes(class: Hansel::Record, fields: { "id" => human.id, "name" => human.name})
  end

  it 'is a human with a record' do
    old_name = human.name
    human.update_attributes(name: 'Jane Doe')
    expect(human.records.size).to eq(2)
    expect(human.records.first).to have_attributes(class: Hansel::Record, fields: { "id" => human.id, "name" => old_name})

    expect(human.records.last).to have_attributes(class: Hansel::Record, fields: { "id" => human.id, "name" => human.name }, "previous_record_id" => human.records.first.id)
  end


  describe 'custom serializer' do
  it 'uses custom serializer' do
    c = Class.new do
      define_method(:initialize) do |human|
        @name = human.name
      end
      define_method(:as_json) do |options|
        { name: @name, custom_serializer: true }
      end
    end
    Kernel.const_set "HumanSerializer", c

    human.update_attributes!(name: 'Elon Musk')
    expect(human.records.size).to eq(2)
    expect(human.records.last).to have_attributes(class: Hansel::Record, fields: { "name" => human.name, "custom_serializer" => true })
  end
  end
end
