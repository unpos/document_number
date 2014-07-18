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

  it 'gets array of numbers' do
    expect(Inventory.get_numbers(3)).to eq(%w(1 2 3))
  end

  it 'assigns number after initialization if has with_number' do
    expect(Inventory.new(with_number: true).number).to eq('1')
  end

  it 'does not assign number after initialization' do
    expect(Inventory.new.number).to be_nil
  end
end
