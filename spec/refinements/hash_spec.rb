require 'spec_helper'
require 'refinements/hash'

describe Hash do

  describe '#camel_case_keys' do

    it 'should convert "String" keys to UpperCamelCase by default (and skip keys that are already UpperCamelCase)' do
      hash = {
        'lowerCamelCase' => nil,
        'snake_case' => nil,
        'UpperCamelCase' => nil,
      }
      hash.camel_case_keys.should == {
        'LowerCamelCase' => nil,
        'SnakeCase' => nil,
        'UpperCamelCase' => nil,
      }
    end

    it 'can convert "String" keys to lowerCamelCase if the "lower" option is specified' do
      hash = {
        'lowerCamelCase' => nil,
        'snake_case' => nil,
        'UpperCamelCase' => nil,
      }
      hash.camel_case_keys(:lower => true).should == {
        'lowerCamelCase' => nil,
        'snakeCase' => nil,
        'upperCamelCase' => nil,
      }
    end

    it 'should skip keys that cannot be converted to {lower,Upper}CamelCase' do
      hash = {
        'lowerCamelCase' => nil,
        'snake_case' => nil,
        'UpperCamelCase' => nil,
        0 => nil,
        [] => nil,
        false => nil,
      }
      hash.camel_case_keys.should == {
        'LowerCamelCase' => nil,
        'SnakeCase' => nil,
        'UpperCamelCase' => nil,
        0 => nil,
        [] => nil,
        false => nil,
      }
    end

  end

  describe '#camel_case_keys!' do

    it 'should convert "String" keys to UpperCamelCase by default (and skip keys that are already UpperCamelCase)' do
      hash = {
        'lowerCamelCase' => nil,
        'snake_case' => nil,
        'UpperCamelCase' => nil,
      }
      hash.camel_case_keys!
      hash.should == {
        'LowerCamelCase' => nil,
        'SnakeCase' => nil,
        'UpperCamelCase' => nil,
      }
    end

    it 'can convert "String" keys to lowerCamelCase if the "lower" option is specified' do
      hash = {
        'lowerCamelCase' => nil,
        'snake_case' => nil,
        'UpperCamelCase' => nil,
      }
      hash.camel_case_keys!(:lower => true)
      hash.should == {
        'lowerCamelCase' => nil,
        'snakeCase' => nil,
        'upperCamelCase' => nil,
      }
    end

    it 'should skip keys that cannot be converted to {lower,Upper}CamelCase' do
      hash = {
        'lowerCamelCase' => nil,
        'snake_case' => nil,
        'UpperCamelCase' => nil,
        0 => nil,
        [] => nil,
        false => nil,
      }
      hash.camel_case_keys!
      hash.should == {
        'LowerCamelCase' => nil,
        'SnakeCase' => nil,
        'UpperCamelCase' => nil,
        0 => nil,
        [] => nil,
        false => nil,
      }
    end

  end

  describe '#snake_case_keys' do

    it 'should snake_case "String" keys regardless of case (and skip keys that are already snake_case)' do
      hash = {
        'lowerCamelCase' => nil,
        'snake_case' => nil,
        'UpperCamelCase' => nil,
      }
      hash.snake_case_keys!
      hash.should == {
        'lower_camel_case' => nil,
        'snake_case' => nil,
        'upper_camel_case' => nil,
      }
    end

    it 'should skip keys that cannot be converted to snake_case' do
      hash = {
        'lowerCamelCase' => nil,
        'snake_case' => nil,
        'UpperCamelCase' => nil,
        0 => nil,
        [] => nil,
        false => nil,
      }
      hash.snake_case_keys!
      hash.should == {
        'lower_camel_case' => nil,
        'snake_case' => nil,
        'upper_camel_case' => nil,
        0 => nil,
        [] => nil,
        false => nil,
      }
    end

  end

  describe '#snake_case_keys!' do

    it 'should snake_case "String" keys regardless of case (and skip keys that are already snake_case)' do
      hash = {
        'lowerCamelCase' => nil,
        'snake_case' => nil,
        'UpperCamelCase' => nil,
      }
      hash.snake_case_keys.should == {
        'lower_camel_case' => nil,
        'snake_case' => nil,
        'upper_camel_case' => nil,
      }
    end

    it 'should skip keys that cannot be converted to snake_case' do
      hash = {
        'lowerCamelCase' => nil,
        'snake_case' => nil,
        'UpperCamelCase' => nil,
        0 => nil,
        [] => nil,
        false => nil,
      }
      hash.snake_case_keys.should == {
        'lower_camel_case' => nil,
        'snake_case' => nil,
        'upper_camel_case' => nil,
        0 => nil,
        [] => nil,
        false => nil,
      }
    end

  end

  describe '#symbolize_keys' do

    it 'should symbolize "String" keys regardless of case (and skip keys that are already symbols)' do
      hash = {
        'lowerCamelCase' => nil,
        'snake_case' => nil,
        :symbol => nil,
        'UpperCamelCase' => nil,
      }
      hash.symbolize_keys.should == {
        :lowerCamelCase => nil,
        :snake_case => nil,
        :symbol => nil,
        :UpperCamelCase => nil,
      }
    end

    it 'should skip keys that cannot be symbolized' do
      hash = {
        'lowerCamelCase' => nil,
        'snake_case' => nil,
        :symbol => nil,
        'UpperCamelCase' => nil,
        0 => nil,
        [] => nil,
        false => nil,
      }
      hash.symbolize_keys.should == {
        :lowerCamelCase => nil,
        :snake_case => nil,
        :symbol => nil,
        :UpperCamelCase => nil,
        0 => nil,
        [] => nil,
        false => nil,
      }
    end

    it 'should skip keys that are already symbols' do
      hash = {
        'lowerCamelCase' => nil,
        'snake_case' => nil,
        :symbol => nil,
        'UpperCamelCase' => nil,
      }
      hash.symbolize_keys.should == {
        :lowerCamelCase => nil,
        :snake_case => nil,
        :symbol => nil,
        :UpperCamelCase => nil,
      }
    end

  end

  describe '#symbolize_keys!' do

    it 'should symbolize "String" keys regardless of case (and skip keys that are already symbols)' do
      hash = {
        'lowerCamelCase' => nil,
        'snake_case' => nil,
        :symbol => nil,
        'UpperCamelCase' => nil,
      }
      hash.symbolize_keys!
      hash.should == {
        :lowerCamelCase => nil,
        :snake_case => nil,
        :symbol => nil,
        :UpperCamelCase => nil,
      }
    end

    it 'should skip keys that cannot be symbolized' do
      hash = {
        'lowerCamelCase' => nil,
        'snake_case' => nil,
        :symbol => nil,
        'UpperCamelCase' => nil,
        0 => nil,
        [] => nil,
        false => nil,
      }
      hash.symbolize_keys!
      hash.should == {
        :lowerCamelCase => nil,
        :snake_case => nil,
        :symbol => nil,
        :UpperCamelCase => nil,
        0 => nil,
        [] => nil,
        false => nil,
      }
    end

    it 'should skip keys that are already symbols' do
      hash = {
        'lowerCamelCase' => nil,
        'snake_case' => nil,
        :symbol => nil,
        'UpperCamelCase' => nil,
      }
      hash.symbolize_keys!
      hash.should == {
        :lowerCamelCase => nil,
        :snake_case => nil,
        :symbol => nil,
        :UpperCamelCase => nil,
      }
    end

  end

end
