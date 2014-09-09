require 'spec_helper'
require 'helpers/layout_helper'

describe LayoutHelper do
  describe '#num_cols' do
    it 'will read num_cols from config if specified' do
      subject = LayoutHelper.new({:num_cols => 100})
      expect(subject.num_cols).to eq(100)
    end

    it 'will calculate num_cols' do
      subject = LayoutHelper.new({})
      expect(subject.num_cols).not_to be_nil
    end
  end

  describe '#num_rows' do
    it 'will read num_rows from config if specified' do
      subject = LayoutHelper.new({:num_rows => 50})
      expect(subject.num_rows).to eq(50)
    end

    it 'will calculate num_rows' do
      subject = LayoutHelper.new({})
      expect(subject.num_rows).not_to be_nil
    end
  end

  describe '#reset_layout' do
    it 'will reset num_cols and num_rows' do
      subject = LayoutHelper.new({:num_cols => 100, :num_rows => 50})

      subject.reset_layout

      [:@num_cols, :@num_rows].each do |instance_variable|
        expect(subject.instance_variable_get(instance_variable)).to be_nil
      end
    end
  end

  describe '#strip_ansi_escape_sequences?' do
    it 'will read strip_ansi_escape_sequences from config if specified' do
      subject = LayoutHelper.new({:strip_ansi_escape_sequences => true})
      expect(subject.strip_ansi_escape_sequences?).to eq(true)
    end

    it 'will determine strip_ansi_escape_sequences' do
      subject = LayoutHelper.new({})
      expect(subject.strip_ansi_escape_sequences?).to eq(false)
    end
  end
end
