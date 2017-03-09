require 'spec_helper'
require 'refinements/object'

describe Object do
  describe '#blank?' do
    it 'is blank if an object is nil, empty or falsy' do
      [nil, [], {}, '', false].each do |value|
        expect(value.blank?).to eq(true)
      end
    end

    it 'is not blank if an object is not nil, empty or falsy' do
      [['foo'], {:foo => 'bar'}, 'foo', true].each do |value|
        expect(value.blank?).to eq(false)
      end
    end
  end

  describe 'false?' do
    it 'should return `true` if the value is[-a] `FalseClass`' do
      subject = false
      expect(subject.false?).to eq(true)
    end

    it 'should return `false` for everything else' do
      subject = true
      expect(subject.false?).to eq(false)
    end
  end

  describe '#presence' do
    it 'will return self if present' do
      [['foo'], {:foo => 'bar'}, 'foo', true].each do |value|
        expect(value.presence).to eq(value)
      end
    end

    it 'will return nil if not present' do
      [nil, [], {}, '', false].each do |value|
        expect(value.presence).to be_nil
      end
    end
  end

  describe '#present?' do
    it 'is present if an object is not nil, empty or falsy' do
      [['foo'], {:foo => 'bar'}, 'foo', true].each do |value|
        expect(value.present?).to eq(true)
      end
    end

    it 'is not present if an object is nil, empty or falsy' do
      [nil, [], {}, '', false].each do |value|
        expect(value.present?).to eq(false)
      end
    end
  end

  describe 'true?' do
    it 'should return `true` if the value is[-a] `TrueClass`' do
      subject = true
      expect(subject.true?).to eq(true)
    end

    it 'should return `false` for everything else' do
      subject = false
      expect(subject.true?).to eq(false)
    end
  end

  describe '#try' do
    context 'object nil' do
      subject {nil}

      it 'returns nil when called with a block' do
        expect(subject.try { |x| 'foo' }).to be_nil
      end

      it 'returns nil when called with arguments' do
        expect(subject.try(:foo, :bar)).to be_nil
      end
    end

    context 'object not nil' do
      subject {Hash[:foo, :bar]}

      it 'yields the object to a block' do
        expect(subject.try { |x| x[:foo] }).to eq(:bar)
      end

      it 'invokes methods that are public' do
        expect(subject.try(:keys)).to match_array([:foo])
      end

      it 'does not invoke methods that are not public' do
        expect {subject.try(:initialize)}.to raise_error(NoMethodError)
      end
    end
  end
end
