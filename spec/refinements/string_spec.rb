require 'spec_helper'
require 'refinements/string'

describe String do

  describe 'to_regexp' do

    it 'should produce a "Regexp" object' do
      string = 'hello world.'
      string.to_regexp.should == /hello world./
    end

    it 'should produce an escaped "Regexp" object when the escape option is specified' do
      string = 'hello world.^$'
      string.to_regexp(:escape => true).should == /hello\ world\.\^\$/
    end

  end

end
