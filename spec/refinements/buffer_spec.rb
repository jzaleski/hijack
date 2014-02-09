require 'spec_helper'
require 'refinements/buffer'

describe Buffer do

  describe 'gets' do

    it 'should always return the first item in the buffer' do
      buffer = Buffer.new
      1.upto(3) {|n| buffer.puts(n)}
      1.upto(3) {|n| buffer.gets.should == n}
    end

  end

  describe 'puts' do

    it 'should always append the item to the end of the buffer' do
      # admittedly this is not the best test, but it does the job and is more
      # reliable than using "instance_variable_get"
      buffer = Buffer.new
      buffer.puts(1)
      buffer.length.should == 1
      buffer.puts(2)
      buffer.length.should == 2
      buffer.gets.should == 1
    end

  end

end
