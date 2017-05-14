require 'spec_helper'
require 'classes/buffer'

describe Buffer do
  subject { Buffer.new({}) }

  describe '#gets' do
    it 'should always return the first item in the buffer' do
      1.upto(3) { |n| subject.puts(n) }
      1.upto(3) { |n| expect(subject.gets).to eq(n) }
    end
  end

  describe '#puts' do
    it 'should always append the item to the end of the buffer' do
      # admittedly this is not the best test, but it does the job and is more
      # reliable than using "instance_variable_get"
      subject.puts(1)
      expect(subject.length).to eq(1)
      subject.puts(2)
      expect(subject.length).to eq(2)
      expect(subject.gets).to eq(1)
    end
  end
end
