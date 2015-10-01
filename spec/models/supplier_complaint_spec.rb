require 'spec_helper'

describe SupplierComplaint do
  context 'without prefix' do
    before do
      SupplierComplaint.has_document_number(prefix: nil, start: 500)
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

    context 'validation fails' do
      it 'next record gets correct number' do
        supplier_complaint1 = SupplierComplaint.create(text: 'complaint1')
        supplier_complaint2 = SupplierComplaint.create(text: '')
        supplier_complaint3 = SupplierComplaint.create(text: 'complaint3')
        expect(supplier_complaint1.number).to eq('500')
        expect(supplier_complaint2).to be_invalid
        expect(supplier_complaint3.number).to eq('501')
      end

      it 'next records get correct number' do
        supplier_complaint1 = SupplierComplaint.create(text: '')
        supplier_complaint2 = SupplierComplaint.create(text: 'complaint2')
        supplier_complaint3 = SupplierComplaint.create(text: 'complaint3')
        expect(supplier_complaint1).to be_invalid
        expect(supplier_complaint2.number).to eq('500')
        expect(supplier_complaint3.number).to eq('501')
      end
    end

    it 'gets array of numbers' do
      expect(SupplierComplaint.get_numbers(3)).to eq(%w(500 501 502))
    end

    context 'has with_number' do
      it 'assigns number after initialization' do
        expect(SupplierComplaint.new(with_number: true).number).to eq('500')
      end
    end

    it 'does not assign number after initialization' do
      expect(SupplierComplaint.new.number).to be_nil
    end
  end

  context 'with prefix' do
    before do
      SupplierComplaint.has_document_number(prefix: 'prefix/', start: 500)
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

    context 'validation fails' do
      it 'next record gets correct number' do
        supplier_complaint1 = SupplierComplaint.create(text: 'complaint1')
        supplier_complaint2 = SupplierComplaint.create(text: '')
        supplier_complaint3 = SupplierComplaint.create(text: 'complaint3')
        expect(supplier_complaint1.number).to eq('prefix/500')
        expect(supplier_complaint2).to be_invalid
        expect(supplier_complaint3.number).to eq('prefix/501')
      end
    end

    it 'gets array of numbers' do
      expect(SupplierComplaint.get_numbers(3)).to eq(%w(prefix/500 prefix/501 prefix/502))
    end

    context 'has with_number' do
      it 'assigns number after initialization' do
        expect(SupplierComplaint.new(with_number: true).number).to eq('prefix/500')
      end
    end

    it 'does not assign number after initialization' do
      expect(SupplierComplaint.new.number).to be_nil
    end
  end

  context '#update_document_number' do
    before do
      SupplierComplaint.has_document_number(prefix: nil, start: 500)
      SupplierComplaint.create!(text: 'complaint')
    end

    context 'new number is greater or equal then old' do
      it 'updates number' do
        result = SupplierComplaint.update_document_number(505)
        document_row = DocumentNumber::DocumentNumber.find_by_document('supplier_complaint')
        expect(result).to be true
        expect(document_row.number).to eq 505
      end

      it 'updates number if new number equals to old' do
        result = SupplierComplaint.update_document_number(501)
        document_row = DocumentNumber::DocumentNumber.find_by_document('supplier_complaint')
        expect(result).to be true
        expect(document_row.number).to eq 501
      end
    end

    context 'new number is less then old' do
      it 'not updating number' do
        result = SupplierComplaint.update_document_number(400)
        document_row = DocumentNumber::DocumentNumber.find_by_document('supplier_complaint')
        expect(result).to be false
        expect(document_row.number).to eq 501
      end
    end
  end
end
