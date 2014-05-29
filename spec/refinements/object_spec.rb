require 'spec_helper'
require 'refinements/object'

describe Object do

  describe '#blank?' do

    it 'is blank if an object is nil, empty or falsy' do
      [nil, [], {}, '', false].each do |value|
        value.blank?.should == true
      end
    end

    it 'is not blank if an object is not nil, empty or falsy' do
      [['foo'], {:foo => 'bar'}, 'foo', true].each do |value|
        value.blank?.should == false
      end
    end

  end

  describe '#presence' do

    it 'will return self if present' do
      [['foo'], {:foo => 'bar'}, 'foo', true].each do |value|
        value.presence.should == value
      end
    end

    it 'will return nil if not present' do
      [nil, [], {}, '', false].each do |value|
        value.presence.should == nil
      end
    end

  end

  describe '#present?' do

    it 'is present if an object is not nil, empty or falsy' do
      [['foo'], {:foo => 'bar'}, 'foo', true].each do |value|
        value.present?.should == true
      end
    end

    it 'is not present if an object is nil, empty or falsy' do
      [nil, [], {}, '', false].each do |value|
        value.present?.should == false
      end
    end

  end

  describe '#try' do

    context 'object nil' do

      let(:subject) { nil }

      it 'returns nil when called with a block' do
        expect(subject.try {|x| 'foo'}).to be_nil
      end

      it 'returns nil when called with arguments' do
        expect(subject.try(:foo, :bar)).to be_nil
      end

    end

    context 'object not nil' do

      let(:subject) { Hash[:foo, :bar] }

      it 'yields the object to a block' do
        expect(subject.try {|x| x[:foo]}).to eq(:bar)
      end

      it 'invokes methods that are public' do
        expect(subject.try(:keys)).to match_array([:foo])
      end

      it 'does not invoke methods that are not public' do
        expect { subject.try(:initialize) }.to raise_error(NoMethodError)
      end

    end

  end

end
