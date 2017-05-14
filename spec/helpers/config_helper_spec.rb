require 'spec_helper'
require 'helpers/config_helper'

describe ConfigProxy do
  subject { ConfigProxy.new }
end

describe ConfigHelper do
  subject { ConfigHelper.new }

  describe '#process_args' do
    it 'will update config with parsed values' do
      expect(subject.process_args(['--test=true', '--hello=world'])).to \
        eq(HashProxy.new({:test => 'true', :hello => 'world'}))
    end

    it 'will ignore args that are not properly formatted' do
      expect(subject.process_args(['--test=true', 'hello=world'])).to \
        eq(HashProxy.new({:test => 'true'}))
    end
  end

  describe '#process_config_file' do
    class DummyFile
      def initialize(lines)
        @lines = lines
      end

      def each_line
        @lines.each { |line| yield line }
      end
    end

    it 'will short-circuit if the config_file does not exist' do
      expect(File).to receive(:exist?).with('config_file.conf')
      expect(File).to_not receive(:new)
      subject.process_config_file('config_file.conf')
    end

    it 'will process a config_file if it exists' do
      expect(File).to receive(:exist?).and_return(true)
      expect(File).to \
        receive(:new).and_return(DummyFile.new(['test=true', 'hello=world']))
      expect(subject.process_config_file('config_file.conf')).to \
        eq(HashProxy.new({:test => 'true', :hello => 'world'}))
    end

    it 'will ignore comments' do
      expect(File).to receive(:exist?).and_return(true)
      expect(File).to \
        receive(:new).and_return(DummyFile.new(['# comment', 'test=true']))
      expect(subject.process_config_file('config_file.conf')).to \
        eq(HashProxy.new({:test => 'true'}))
    end

    it 'will parse JSON encoded arrays' do
      expect(File).to receive(:exist?).and_return(true)
      expect(File).to \
        receive(:new).and_return(DummyFile.new(['test=["hello", "world"]']))
      expect(subject.process_config_file('config_file.conf')).to \
        eq(HashProxy.new({:test => ['hello', 'world']}))
    end

    it 'will parse JSON encoded hashes' do
      expect(File).to receive(:exist?).and_return(true)
      expect(File).to \
        receive(:new).and_return(DummyFile.new(['test={"hello": "world"}']))
      expect(subject.process_config_file('config_file.conf')).to \
        eq(HashProxy.new({:test => {:hello => 'world'}}))
    end
  end
end
