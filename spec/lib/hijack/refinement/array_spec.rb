require 'spec_helper'
require 'hijack/refinement/array'

describe Array do

  it 'should respond to to_regexp' do
    array = []
    array.respond_to?(:to_regexp).should == true
  end

  it 'should produce a Regexp object when calling to_regexp' do
    array = ['hello', 'world']
    array.to_regexp.should == /(?-mix:hello)|(?-mix:world)/
  end

  it 'should produce an escaped Regexp object when calling to_regexp with the escape option specified' do
    array = ['hello', 'world', '^$.']
    array.to_regexp(:escape => true).should == /(?-mix:hello)|(?-mix:world)|(?-mix:\^\$\.)/
  end

  it 'should raise an error if empty' do
    array = []
    expect{array.to_regexp}.to raise_error('Array must include at least one element')
  end

  it 'should raise an error if the elements do not respond to to_regexp' do
    array = ['hello', 3, 'world']
    expect{array.to_regexp}.to raise_error('All Array elements must have a "to_regexp" method')
  end

end
