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

end
