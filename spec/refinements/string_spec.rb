require 'spec_helper'
require 'refinements/string'

describe String do

  describe '#blank?' do

    it 'is blank if a string is comprised of only whitespace characters' do
      ['', ' ', "\n", "\r", "\t"].each do |value|
        expect(value.blank?).to eq(true)
      end
    end

    it 'is not be blank if a string has at least one non-whitespace character' do
      ['f', ' o', 'o ', "b\n", "\ra", "r\t"].each do |value|
        expect(value.blank?).to eq(false)
      end
    end

  end

  describe '#capitalize' do

    it 'should upcase the first letter and leave the rest of the "String" untouched' do
      subject = 'helloWorld'
      expect(subject.capitalize).to eq('HelloWorld')
    end

    it 'should produce the same value for a "String" that is already capitalized' do
      subject = 'HelloWorld'
      expect(subject.capitalize).to eq('HelloWorld')
    end

  end

  describe '#to_camel_case' do

    it 'should produce an UpperCamelCase "String" by default' do
      subject = 'hello_world'
      expect(subject.to_camel_case).to eq('HelloWorld')
    end

    it 'should produce a lowerCamelCase "String" if the lower argument is provided' do
      subject = 'hello_world'
      expect(subject.to_camel_case(:lower => true)).to eq('helloWorld')
    end

    it 'should produce the same value for a "String" that is already camel-cased' do
      subject = 'HelloWorld'
      expect(subject.to_camel_case).to eq('HelloWorld')
    end

    it 'should be able to convert a lowerCamelCase "String" to an UpperCamelCase "String"' do
      subject = 'helloWorld'
      expect(subject.to_camel_case).to eq('HelloWorld')
    end

    it 'should be able to convert an UpperCamelCase "String" to a lowerCamelCase "String"' do
      subject = 'HelloWorld'
      expect(subject.to_camel_case(:lower => true)).to eq('helloWorld')
    end

  end

  describe '#to_regexp' do

    it 'should produce a "Regexp" object' do
      subject = 'hello world.'
      expect(subject.to_regexp).to eq(/hello world./)
    end

    it 'should produce an escaped "Regexp" object when the escape option is specified' do
      subject = 'hello world.^$'
      expect(subject.to_regexp(:escape => true)).to eq(/hello\ world\.\^\$/)
    end

  end

  describe '#to_snake_case' do

    it 'should be able to convert a lowerCamelCase "String" to snake_case' do
      subject = 'helloWorld'
      expect(subject.to_snake_case).to eq('hello_world')
    end

    it 'should be able to convert an UpperCamelCase "String" to snake_case' do
      subject = 'HelloWorld'
      expect(subject.to_snake_case).to eq('hello_world')
    end

    it 'should produce the same value for a "String" that is already snake_case' do
      subject = 'hello_world'
      expect(subject.to_snake_case).to eq('hello_world')
    end

  end

  describe '#uncapitalize' do

    it 'should downcase the first letter and leave the rest of the "String" untouched' do
      subject = 'HelloWorld'
      expect(subject.uncapitalize).to eq('helloWorld')
    end

    it 'should produce the same value for a "String" that is already uncapitalized' do
      subject = 'helloWorld'
      expect(subject.uncapitalize).to eq('helloWorld')
    end

  end

end
