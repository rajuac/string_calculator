# frozen_string_literal: true

require_relative '../lib/string_calculator'

RSpec.describe StringCalculator do
  let(:calculator) { StringCalculator.new }

  describe '#add' do
    it 'returns 0 for an empty string' do
      expect(calculator.add('')).to eq(0)
    end

    it 'returns the sum of two comma-separated numbers' do
      expect(calculator.add('1,5')).to eq(6)
    end

    it 'handles newlines as separators' do
      expect(calculator.add("1\n2,3")).to eq(6)
    end

    it 'handles single-character custom delimiter' do
      expect(calculator.add("//;\n1;2")).to eq(3)
    end

    it 'handles multi-character custom delimiter' do
      expect(calculator.add("//[***]\n1***2***3")).to eq(6)
    end

    it 'handles delimiter with regex special characters' do
      expect(calculator.add("//[*.]\n1*.2*.3")).to eq(6)
    end

    it 'handles empty input after delimiter' do
      expect(calculator.add("//;\n")).to eq(0)
    end

    it 'throws an exception for a single negative number' do
      expect { calculator.add('-1') }.to raise_error('negative numbers not allowed -1')
    end

    it 'throws an exception listing all negative numbers' do
      expect { calculator.add('1,-2,3,-4') }.to raise_error('negative numbers not allowed -2,-4')
    end
  end
end
