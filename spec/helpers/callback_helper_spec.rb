require 'spec_helper'
require 'helpers/callback_helper'

describe CallbackHelper do

  subject {CallbackHelper.new}

  # this isn't great, but it gives us everything needed to adequately test the
  # helper, futhermore, it doesn't make sense to expose the "callbacks" Hash
  let(:callbacks) {subject.instance_variable_get(:@callbacks)}

  describe '#add_match' do

    it 'will accept a String pattern' do
      match = 'hello'
      callback = lambda {}
      subject.add_match(match, callback)
      callbacks[match].should == [callback]
    end

    it 'will accept a Regexp pattern' do
      match = /hello/
      callback = lambda {}
      subject.add_match(match, callback)
      callbacks[match].should == [callback]
    end

    it 'will allow multiple callbacks for the same pattern' do
      match = /hello/
      mock_callbacks = 1.upto(3).map {|n| lambda {'callback %s' % n}}
      mock_callbacks.each {|callback| subject.add_match(match, callback)}
      callbacks[match].should == mock_callbacks
    end

  end

  describe '#process' do

    it 'will invoke all callbacks for a line matching a pattern' do
      line = 'hello'
      match = /hello/
      3.times do
        callback = lambda {}
        callback.should_receive(:call).with(line)
        subject.add_match(match, callback)
      end
      subject.process(line)
    end

    it 'will clear the pattern and all callbacks on a successful match' do
      line = 'hello'
      match = /hello/
      3.times {subject.add_match(match, lambda {})}
      subject.process(line)
      callbacks[match].should be_nil
    end

  end

end
