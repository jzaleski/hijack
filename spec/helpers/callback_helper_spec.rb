require 'spec_helper'
require 'helpers/callback_helper'

describe CallbackHelper do

  before do
    @subject = CallbackHelper.new
    # this isn't great, but it gives us everything needed to adequately test the
    # helper, futhermore, it doesn't make sense to expose the "callbacks" Hash
    @callbacks = @subject.instance_variable_get(:@callbacks)
  end

  describe 'add_match' do

    it 'will accept a String pattern' do
      match = 'hello'
      callback = lambda {}
      @subject.add_match(match, callback)
      @callbacks[match].should == [callback]
    end

    it 'will accept a Regexp pattern' do
      match = /hello/
      callback = lambda {}
      @subject.add_match(match, callback)
      @callbacks[match].should == [callback]
    end

    it 'will allow multiple callbacks for the same pattern' do
      match = /hello/
      callbacks = 1.upto(3).map {|i| lambda {'callback %s' % i}}
      callbacks.each {|callback| @subject.add_match(match, callback)}
      @callbacks[match].should == callbacks
    end

  end

  describe 'process' do

    it 'will invoke all callbacks for a line matching a pattern' do
      line = 'hello'
      match = /hello/
      3.times do
        callback = lambda {}
        callback.should_receive(:call).with(line)
        @subject.add_match(match, callback)
      end
      @subject.process(line)
    end

    it 'will clear the pattern and all callbacks on a successful match' do
      line = 'hello'
      match = /hello/
      3.times {@subject.add_match(match, lambda {})}
      @subject.process(line)
      @callbacks[match].should be_nil
    end

  end

end
