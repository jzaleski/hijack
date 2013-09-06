require 'spec_helper'
require 'hijack/refinement/string'

describe String do

  it 'should respond to to_regexp' do
    string = 'hello world.'
    string.respond_to?(:to_regexp).should == true
  end

  it 'should produce a Regexp object when calling to_regexp' do
    string = 'hello world.'
    string.to_regexp.should == /hello world./
  end

  it 'should produce an escaped Regexp object when calling to_regexp with the escape option specified' do
    string = 'hello world.'
    string.to_regexp(:escape => true).should == /hello\ world\./
  end

end
