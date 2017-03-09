require 'spec_helper'
require 'refinements/hash'

describe Hash do
  describe '#camel_case_keys' do
    it 'should convert "String" keys to UpperCamelCase by default (and skip keys that are already UpperCamelCase)' do
      subject = {
        'lowerCamelCase' => nil,
        'snake_case' => nil,
        'UpperCamelCase' => nil,
      }
      expect(subject.camel_case_keys).to eq({
        'LowerCamelCase' => nil,
        'SnakeCase' => nil,
        'UpperCamelCase' => nil,
      })
    end

    it 'can convert "String" keys to lowerCamelCase if the "lower" option is specified' do
      subject = {
        'lowerCamelCase' => nil,
        'snake_case' => nil,
        'UpperCamelCase' => nil,
      }
      expect(subject.camel_case_keys(:lower => true)).to eq({
        'lowerCamelCase' => nil,
        'snakeCase' => nil,
        'upperCamelCase' => nil,
      })
    end

    it 'should skip keys that cannot be converted to {lower,Upper}CamelCase' do
      subject = {
        'lowerCamelCase' => nil,
        'snake_case' => nil,
        'UpperCamelCase' => nil,
        0 => nil,
        [] => nil,
        false => nil,
      }
      expect(subject.camel_case_keys).to eq({
        'LowerCamelCase' => nil,
        'SnakeCase' => nil,
        'UpperCamelCase' => nil,
        0 => nil,
        [] => nil,
        false => nil,
      })
    end
  end

  describe '#camel_case_keys!' do
    it 'should convert "String" keys to UpperCamelCase by default (and skip keys that are already UpperCamelCase)' do
      subject = {
        'lowerCamelCase' => nil,
        'snake_case' => nil,
        'UpperCamelCase' => nil,
      }
      subject.camel_case_keys!
      expect(subject).to eq({
        'LowerCamelCase' => nil,
        'SnakeCase' => nil,
        'UpperCamelCase' => nil,
      })
    end

    it 'can convert "String" keys to lowerCamelCase if the "lower" option is specified' do
      subject = {
        'lowerCamelCase' => nil,
        'snake_case' => nil,
        'UpperCamelCase' => nil,
      }
      subject.camel_case_keys!(:lower => true)
      expect(subject).to eq({
        'lowerCamelCase' => nil,
        'snakeCase' => nil,
        'upperCamelCase' => nil,
      })
    end

    it 'should skip keys that cannot be converted to {lower,Upper}CamelCase' do
      subject = {
        'lowerCamelCase' => nil,
        'snake_case' => nil,
        'UpperCamelCase' => nil,
        0 => nil,
        [] => nil,
        false => nil,
      }
      subject.camel_case_keys!
      expect(subject).to eq({
        'LowerCamelCase' => nil,
        'SnakeCase' => nil,
        'UpperCamelCase' => nil,
        0 => nil,
        [] => nil,
        false => nil,
      })
    end
  end

  describe '#snake_case_keys' do
    it 'should snake_case "String" keys regardless of case (and skip keys that are already snake_case)' do
      subject = {
        'lowerCamelCase' => nil,
        'snake_case' => nil,
        'UpperCamelCase' => nil,
      }
      expect(subject.snake_case_keys).to eq({
        'lower_camel_case' => nil,
        'snake_case' => nil,
        'upper_camel_case' => nil,
      })
    end

    it 'should skip keys that cannot be converted to snake_case' do
      subject = {
        'lowerCamelCase' => nil,
        'snake_case' => nil,
        'UpperCamelCase' => nil,
        0 => nil,
        [] => nil,
        false => nil,
      }
      expect(subject.snake_case_keys).to eq({
        'lower_camel_case' => nil,
        'snake_case' => nil,
        'upper_camel_case' => nil,
        0 => nil,
        [] => nil,
        false => nil,
      })
    end
  end

  describe '#snake_case_keys!' do
    it 'should snake_case "String" keys regardless of case (and skip keys that are already snake_case)' do
      subject = {
        'lowerCamelCase' => nil,
        'snake_case' => nil,
        'UpperCamelCase' => nil,
      }
      subject.snake_case_keys!
      expect(subject).to eq({
        'lower_camel_case' => nil,
        'snake_case' => nil,
        'upper_camel_case' => nil,
      })
    end

    it 'should skip keys that cannot be converted to snake_case' do
      subject = {
        'lowerCamelCase' => nil,
        'snake_case' => nil,
        'UpperCamelCase' => nil,
        0 => nil,
        [] => nil,
        false => nil,
      }
      subject.snake_case_keys!
      expect(subject).to eq({
        'lower_camel_case' => nil,
        'snake_case' => nil,
        'upper_camel_case' => nil,
        0 => nil,
        [] => nil,
        false => nil,
      })
    end
  end

  describe '#stringify_keys' do
    it 'should stringify "String" keys regardless of case or `class`' do
      subject = {
        'string' => nil,
        0 => nil,
        0.1 => nil,
        :UpperCamelCase => nil,
        :lowerCamelCase => nil,
        :snake_case => nil,
        false => nil,
        true => nil,
      }
      expect(subject.stringify_keys).to eq({
        'string' => nil,
        '0' => nil,
        '0.1' => nil,
        'UpperCamelCase' => nil,
        'lowerCamelCase' => nil,
        'snake_case' => nil,
        'false' => nil,
        'true' => nil,
      })
    end
  end

  describe '#stringify_keys!' do
    it 'should stringify "String" keys regardless of case or `class`' do
      subject = {
        'string' => nil,
        0 => nil,
        0.1 => nil,
        :UpperCamelCase => nil,
        :lowerCamelCase => nil,
        :snake_case => nil,
        false => nil,
        true => nil,
      }
      subject.stringify_keys!
      expect(subject).to eq({
        'string' => nil,
        '0' => nil,
        '0.1' => nil,
        'UpperCamelCase' => nil,
        'lowerCamelCase' => nil,
        'snake_case' => nil,
        'false' => nil,
        'true' => nil,
      })
    end
  end

  describe '#symbolize_keys' do
    it 'should symbolize "String" keys regardless of case (and skip keys that are already symbols)' do
      subject = {
        'lowerCamelCase' => nil,
        'snake_case' => nil,
        :symbol => nil,
        'UpperCamelCase' => nil,
      }
      expect(subject.symbolize_keys).to eq({
        :lowerCamelCase => nil,
        :snake_case => nil,
        :symbol => nil,
        :UpperCamelCase => nil,
      })
    end

    it 'should skip keys that cannot be symbolized' do
      subject = {
        'lowerCamelCase' => nil,
        'snake_case' => nil,
        :symbol => nil,
        'UpperCamelCase' => nil,
        0 => nil,
        [] => nil,
        false => nil,
      }
      expect(subject.symbolize_keys).to eq({
        :lowerCamelCase => nil,
        :snake_case => nil,
        :symbol => nil,
        :UpperCamelCase => nil,
        0 => nil,
        [] => nil,
        false => nil,
      })
    end

    it 'should skip keys that are already symbols' do
      subject = {
        'lowerCamelCase' => nil,
        'snake_case' => nil,
        :symbol => nil,
        'UpperCamelCase' => nil,
      }
      expect(subject.symbolize_keys).to eq({
        :lowerCamelCase => nil,
        :snake_case => nil,
        :symbol => nil,
        :UpperCamelCase => nil,
      })
    end
  end

  describe '#symbolize_keys!' do
    it 'should symbolize "String" keys regardless of case (and skip keys that are already symbols)' do
      subject = {
        'lowerCamelCase' => nil,
        'snake_case' => nil,
        :symbol => nil,
        'UpperCamelCase' => nil,
      }
      subject.symbolize_keys!
      expect(subject).to eq({
        :lowerCamelCase => nil,
        :snake_case => nil,
        :symbol => nil,
        :UpperCamelCase => nil,
      })
    end

    it 'should skip keys that cannot be symbolized' do
      subject = {
        'lowerCamelCase' => nil,
        'snake_case' => nil,
        :symbol => nil,
        'UpperCamelCase' => nil,
        0 => nil,
        [] => nil,
        false => nil,
      }
      subject.symbolize_keys!
      expect(subject).to eq({
        :lowerCamelCase => nil,
        :snake_case => nil,
        :symbol => nil,
        :UpperCamelCase => nil,
        0 => nil,
        [] => nil,
        false => nil,
      })
    end

    it 'should skip keys that are already symbols' do
      subject = {
        'lowerCamelCase' => nil,
        'snake_case' => nil,
        :symbol => nil,
        'UpperCamelCase' => nil,
      }
      subject.symbolize_keys!
      expect(subject).to eq({
        :lowerCamelCase => nil,
        :snake_case => nil,
        :symbol => nil,
        :UpperCamelCase => nil,
      })
    end
  end
end
