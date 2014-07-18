require 'spec_helper'

describe PriceAdjustment do
  it 'uses non-default column' do
    price_adjustment = PriceAdjustment.create
    expect(price_adjustment.document_number).not_to be_nil
  end

  it 'starts from predefined value' do
    price_adjustment = PriceAdjustment.create
    expect(price_adjustment.document_number).to eq('500')
  end

  it 'has sequence of numbers' do
    expect(PriceAdjustment.create.document_number).to eq('500')
    expect(PriceAdjustment.create.document_number).to eq('501')
  end

  it 'gets array of numbers' do
    expect(PriceAdjustment.get_numbers(3)).to eq(%w(500 501 502))
  end

  it 'assigns number after initialization if has with_number' do
    expect(PriceAdjustment.new(with_number: true).document_number).to eq('500')
  end

  it 'does not assign number after initialization' do
    expect(PriceAdjustment.new.document_number).to be_nil
  end
end
