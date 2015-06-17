require 'spec_helper'

describe SupplierComplaint do
  context 'without prefix' do
    before(:each) do
      SupplierComplaint.has_document_number(prefix: nil, start: 500)
      # document_row = DocumentNumber::DocumentNumber.find_by_document('supplier_complaint')
      # document_row.update_attributes(number: 1) if document_row
    end

    it 'uses default column' do
      supplier_complaint = SupplierComplaint.create
      expect(supplier_complaint.number).not_to be_nil
    end

    it 'starts from predefined value' do
      supplier_complaint = SupplierComplaint.create(text: 'some')
      expect(supplier_complaint.number).to eq('500')
    end

    it 'has sequence of numbers' do
      supplier_complaint1 = SupplierComplaint.create(text: 'complaint1')
      supplier_complaint2 = SupplierComplaint.create(text: 'complaint2')
      expect(supplier_complaint1.number).to eq('500')
      expect(supplier_complaint2.number).to eq('501')
    end

    it 'if validation fails next record gets correct number' do
      supplier_complaint1 = SupplierComplaint.create(text: 'complaint1')
      supplier_complaint2 = SupplierComplaint.create(text: '')
      supplier_complaint3 = SupplierComplaint.create(text: 'complaint3')
      expect(supplier_complaint1.number).to eq('500')
      expect(supplier_complaint2).to be_invalid
      expect(supplier_complaint3.number).to eq('501')
    end

    it 'if validation fails next records g correct number' do
      supplier_complaint1 = SupplierComplaint.create(text: '')
      supplier_complaint2 = SupplierComplaint.create(text: 'complaint2')
      supplier_complaint3 = SupplierComplaint.create(text: 'complaint3')
      expect(supplier_complaint1).to be_invalid
      expect(supplier_complaint2.number).to eq('500')
      expect(supplier_complaint3.number).to eq('501')
    end

    it 'gets array of numbers' do
      expect(SupplierComplaint.get_numbers(3)).to eq(%w(500 501 502))
    end

    it 'assigns number after initialization if has with_number' do
      expect(SupplierComplaint.new(with_number: true).number).to eq('500')
    end

    it 'does not assign number after initialization' do
      expect(SupplierComplaint.new.number).to be_nil
    end
  end

  context 'with prefix' do
    before(:each) do
      SupplierComplaint.has_document_number(prefix: 'prefix/', start: 500)
      # document_row = DocumentNumber::DocumentNumber.find_by_document('supplier_complaint')
      # document_row.update_attributes(number: 1) if document_row
    end

    it 'uses default column' do
      supplier_complaint = SupplierComplaint.create
      expect(supplier_complaint.number).not_to be_nil
    end

    it 'starts from predefined value' do
      supplier_complaint = SupplierComplaint.create(text: 'some')
      expect(supplier_complaint.number).to eq('prefix/500')
    end

    it 'has sequence of numbers' do
      supplier_complaint1 = SupplierComplaint.create(text: 'complaint1')
      supplier_complaint2 = SupplierComplaint.create(text: 'complaint2')
      expect(supplier_complaint1.number).to eq('prefix/500')
      expect(supplier_complaint2.number).to eq('prefix/501')
    end

    it 'if validation fails next record gets correct number' do
      supplier_complaint1 = SupplierComplaint.create(text: 'complaint1')
      supplier_complaint2 = SupplierComplaint.create(text: '')
      supplier_complaint3 = SupplierComplaint.create(text: 'complaint3')
      expect(supplier_complaint1.number).to eq('prefix/500')
      expect(supplier_complaint2).to be_invalid
      expect(supplier_complaint3.number).to eq('prefix/501')
    end

    it 'gets array of numbers' do
      expect(SupplierComplaint.get_numbers(3)).to eq(%w(prefix/500 prefix/501 prefix/502))
    end

    it 'assigns number after initialization if has with_number' do
      expect(SupplierComplaint.new(with_number: true).number).to eq('prefix/500')
    end

    it 'does not assign number after initialization' do
      expect(SupplierComplaint.new.number).to be_nil
    end
  end
end
