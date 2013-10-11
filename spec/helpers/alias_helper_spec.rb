require 'spec_helper'
require 'helpers/alias_helper'

describe AliasHelper do

  describe 'process' do

    before do
      @subject = AliasHelper.new({})
    end

    it 'will do nothing if there are no aliases configured' do
      @subject.should_receive(:aliases).at_least(:once).
        and_return({})

      @subject.process('foo').should == 'foo'
    end

    it 'will do nothing if there are no aliases mapped to the command' do
      @subject.should_receive(:aliases).at_least(:once).
        and_return({:bar => 'biz'})

      @subject.process('foo').should == 'foo'
    end

    it 'will replace an alias' do
      @subject.should_receive(:aliases).at_least(:once).
        and_return({:foo => 'bar'})

      @subject.process('foo').should == 'bar'
    end

    it 'will recursively replace aliases' do
      @subject.should_receive(:aliases).at_least(:once).
        and_return({:foo => 'bar', :bar => 'biz'})

      @subject.process('foo').should == 'biz'
    end

  end

end
