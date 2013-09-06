require 'spec_helper'
require 'hijack/refinement/buffer'

describe Buffer do

  it 'should respond to gets' do
    Buffer.new.respond_to?(:gets).should == true
  end

  it 'should respond to puts' do
    Buffer.new.respond_to?(:puts).should == true
  end

  it 'should operate like a FIFO queue' do
    buffer = Buffer.new
    1.upto(3) {|n| buffer.puts(n)}
    1.upto(3) do |n|
      buffer.gets.should == n
    end
  end

end
