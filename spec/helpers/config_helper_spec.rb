require 'spec_helper'
require 'helpers/config_helper'

describe ConfigProxy do; end

describe ConfigHelper do

  before do
    @subject = ConfigHelper.new
  end

  describe 'process_args' do

    it 'will update config with parsed values' do
      @subject.process_args(['--test=true', '--hello=world']).should == \
        HashProxy.new({:test => 'true', :hello => 'world'})
    end

    it 'will ignore args that are not properly formatted' do
      @subject.process_args(['--test=true', 'hello=world']).should == \
        HashProxy.new({:test => 'true'})
    end

  end

  describe 'process_config_file' do

    class DummyFile

      def initialize(lines)
        @lines = lines
      end

      def each_line
        @lines.each do |line|
          yield line
        end
      end

    end

    it 'will short-circuit if the config_file does not exist' do
      File.should_receive(:exist?).with('config_file.conf')
      File.should_not_receive(:new)
      @subject.process_config_file('config_file.conf')
    end

    it 'will process a config_file if it exists' do
      File.stub(:exist?).and_return(true)
      File.stub(:new).and_return(DummyFile.new(['test=true', 'hello=world']))
      @subject.process_config_file('config_file.conf').should == \
        HashProxy.new({:test => 'true', :hello => 'world'})
    end

    it 'will ignore comments' do
      File.stub(:exist?).and_return(true)
      File.stub(:new).and_return(DummyFile.new(['# comment', 'test=true']))
      @subject.process_config_file('config_file.conf').should == \
        HashProxy.new({:test => 'true'})
    end

    it 'will parse JSON encoded arrays' do
      File.stub(:exist?).and_return(true)
      File.stub(:new).and_return(DummyFile.new(['test=["hello", "world"]']))
      @subject.process_config_file('config_file.conf').should == \
        HashProxy.new({:test => ['hello', 'world']})
    end

    it 'will parse JSON encoded hashes' do
      File.stub(:exist?).and_return(true)
      File.stub(:new).and_return(DummyFile.new(['test={"hello": "world"}']))
      @subject.process_config_file('config_file.conf').should == \
        HashProxy.new({:test => {:hello => 'world'}})
    end

  end

end
