require 'spec_helper'
require 'helpers/alias_helper'

describe AliasHelper do
  describe '#process' do
    subject { AliasHelper.new({}) }

    it 'will do nothing if there are no aliases configured' do
      expect(subject).to \
        receive(:aliases).at_least(:once).and_return({})
      expect(subject.process('foo')).to eq('foo')
    end

    it 'will do nothing if there are no aliases mapped to the command' do
      expect(subject).to \
        receive(:aliases).at_least(:once).and_return({/bar/ => 'biz'})
      expect(subject.process('foo')).to eq('foo')
    end

    it 'will replace an alias' do
      expect(subject).to \
        receive(:aliases).at_least(:once).and_return({/foo/ => 'bar'})
      expect(subject.process('foo')).to eq('bar')
    end

    it 'will recursively replace aliases' do
      expect(subject).to \
        receive(:aliases).at_least(:once).and_return({/foo/ => 'bar', /bar/ => 'biz'})
      expect(subject.process('foo')).to eq('biz')
    end
  end
end
