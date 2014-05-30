require 'spec_helper'
require 'refinements/buffer'

describe Buffer do

  subject {Buffer.new}

  describe '#gets' do

    it 'should always return the first item in the buffer' do
      1.upto(3) {|n| subject.puts(n)}
      1.upto(3) {|n| subject.gets.should == n}
    end

  end

  describe '#puts' do

    it 'should always append the item to the end of the buffer' do
      # admittedly this is not the best test, but it does the job and is more
      # reliable than using "instance_variable_get"
      subject.puts(1)
      subject.length.should == 1
      subject.puts(2)
      subject.length.should == 2
      subject.gets.should == 1
    end

  end

end
