require 'spec_helper'

describe Inventory do
  it 'sets number on create' do
    inventory = Inventory.create
    expect(inventory.number).not_to be_nil
  end

  it 'creates with own number' do
    inventory = Inventory.create number: '500'
    expect(inventory.number).to eq('500')
  end

  it 'does not change number on update' do
    inventory = Inventory.create number: '5'
    inventory.touch
    expect(inventory.number).to eq('5')
  end

  it 'creates sequence of numbers' do
    expect(Inventory.create.number).to eq('1')
    expect(Inventory.create.number).to eq('2')
  end
end
