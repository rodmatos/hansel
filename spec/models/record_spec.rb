require_relative '../spec_helper'

RSpec.describe Hansel::Record, type: :model do
  let!(:record) { Hansel::Record.create }
  it 'is not valid without attributes' do
    expect(record.fields).to be_empty
  end
  it 'is not valid without metadata' do
    expect(record.metadata).to be_empty
  end
  it 'is not valid without a recordable' do
    expect(record.recordable).to eq(nil)
  end
end
