require 'spec_helper'
require 'hijack/refinement/regexp'

describe Regexp do

  it 'should respond to union' do
    Regexp.new('hello').respond_to?(:union).should == true
  end

  it 'should be able to union a String object' do
    Regexp.new('hello').union('world').should == /(?-mix:hello)|(?-mix:world)/
  end

  it 'should be able to union another Regexp object' do
    Regexp.new('hello').union(/world/).should == /(?-mix:hello)|(?-mix:world)/
  end

  it 'should raise an error if others are not or cannot be converted to Regexp objects' do
    expect{Regexp.new('hello').union(123)}.to raise_error('All other elements must be or be convertable to a Regexp Object')
  end

end
