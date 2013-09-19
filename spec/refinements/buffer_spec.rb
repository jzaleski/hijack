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
      buffer = Buffer.new
      1.upto(3) do |n|
        buffer.puts(n)
        # this isn't great but, it gives us what is needed to adequately test
        # the refinement
        buffer.instance_variable_get(:@que).last.should == n
      end
    end

  end

end
