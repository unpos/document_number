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
end
