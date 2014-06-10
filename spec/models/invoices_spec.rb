require 'spec_helper'

describe Invoice do
  it 'sets number on create with prefix' do
    invoice = Invoice.create
    expect(invoice.number).to eq('invoice/1')
  end
end
