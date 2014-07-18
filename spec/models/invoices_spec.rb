require 'spec_helper'

describe Invoice do
  it 'sets number on create with prefix' do
    invoice = Invoice.create
    expect(invoice.number).to eq('invoice/1')
  end

  it 'gets array of numbers with prefix' do
    expect(Invoice.get_numbers(3)).to eq(%w(invoice/1 invoice/2 invoice/3))
  end

  it 'assigns number after initialization if has with_number' do
    expect(Invoice.new(with_number: true).number).to eq('invoice/1')
  end

  it 'does not assign number after initialization' do
    expect(Invoice.new.number).to be_nil
  end
end
