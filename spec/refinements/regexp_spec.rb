require 'spec_helper'
require 'refinements/regexp'

describe Regexp do

  describe '#union' do

    subject {Regexp.new('hello')}

    it 'should be able to union a "String" object' do
      expect(subject.union('world')).to eq(/(?-mix:hello)|(?-mix:world)/)
    end

    it 'should be able to union another "Regexp" object' do
      expect(subject.union(/world/)).to eq(/(?-mix:hello)|(?-mix:world)/)
    end

    it 'should raise an error if others are not or cannot be converted to "Regexp" objects' do
      expect{subject.union(123)}.to \
        raise_error('All other elements must be or be convertable to "Regexp" objects')
    end

  end

end
