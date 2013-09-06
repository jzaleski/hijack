require 'spec_helper'
require 'hijack/refinement/array'

describe Array do

  describe 'to_regexp' do

    it 'should produce a "Regexp" object' do
      array = ['hello', 'world.']
      array.to_regexp.should == /(?-mix:hello)|(?-mix:world.)/
    end

    it 'should produce an escaped "Regexp" object when the escape option is specified' do
      array = ['hello', 'world.^$']
      array.to_regexp(:escape => true).should == /(?-mix:hello)|(?-mix:world\.\^\$)/
    end

    it 'should raise an error if empty' do
      array = []
      expect{array.to_regexp}.to \
        raise_error('Array must include at least one element')
    end

    it 'should raise an error if elements are not or cannot be converted to "Regexp" objects' do
      array = ['hello', 3, 'world']
      expect{array.to_regexp}.to \
        raise_error('All elements must be or be convertable to "Regexp" objects')
    end

  end

end
