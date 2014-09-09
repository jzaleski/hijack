require 'spec_helper'
require 'refinements/array'

describe Array do
  describe '#to_regexp' do
    it 'returns a "Regexp" object' do
      subject = ['hello', 'world.']
      expect(subject.to_regexp).to \
        eq(/(?-mix:hello)|(?-mix:world.)/)
    end

    it 'returns escaped "Regexp" object when the escape option is specified' do
      subject = ['hello', 'world.^$']
      expect(subject.to_regexp(:escape => true)).to \
        eq(/(?-mix:hello)|(?-mix:world\.\^\$)/)
    end

    it 'will raise an error if empty' do
      subject = []
      expect{subject.to_regexp}.to \
        raise_error('Array must include at least one element')
    end

    it 'will raise an error if elements are not or can not be converted' do
      subject = ['hello', 3, 'world']
      expect{subject.to_regexp}.to \
        raise_error('All elements must be or be convertable to "Regexp" objects')
    end
  end
end
