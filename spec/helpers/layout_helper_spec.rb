require 'spec_helper'
require 'helpers/layout_helper'

describe LayoutHelper do

  describe '#num_cols' do

    it 'will read num_cols from config if specified' do
      LayoutHelper.new({:num_cols => 100}).num_cols.should eq(100)
    end

    it 'will calculate num_cols' do
      LayoutHelper.new({}).num_cols.should_not be_nil
    end

  end

  describe '#num_rows' do

    it 'will read num_rows from config if specified' do
      LayoutHelper.new({:num_rows => 50}).num_rows.should eq(50)
    end

    it 'will calculate num_rows' do
      LayoutHelper.new({}).num_rows.should_not be_nil
    end

  end

  describe '#reset_layout' do

    it 'will reset num_cols and num_rows' do
      subject = LayoutHelper.new({:num_cols => 100, :num_rows => 50})

      subject.reset_layout

      [:@num_cols, :@num_rows].each do |instance_variable|
        subject.instance_variable_get(instance_variable).should be_nil
      end
    end

  end

  describe '#strip_ansi_escape_sequences?' do

    it 'will read strip_ansi_escape_sequences from config if specified' do
      LayoutHelper.new({:strip_ansi_escape_sequences => true}).\
        strip_ansi_escape_sequences?.should be_true
    end

    it 'will determine strip_ansi_escape_sequences' do
      LayoutHelper.new({}).strip_ansi_escape_sequences?.should_not be_nil
    end

  end

end
