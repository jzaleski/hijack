require 'spec_helper'
require 'refinements/string'

describe String do

  describe 'blank?' do

    it 'is blank if a string is comprised of only whitespace characters' do
      ['', ' ', "\n", "\r", "\t"].each do |value|
        value.blank?.should == true
      end
    end

    it 'is not be blank if a string has at least one non-whitespace character' do
      ['f', ' o', 'o ', "b\n", "\ra", "r\t"].each do |value|
        value.blank?.should == false
      end
    end

  end

  describe 'capitalize' do

    it 'should upcase the first letter and leave the rest of the "String" untouched' do
      string = 'helloWorld'
      string.capitalize.should == 'HelloWorld'
    end

    it 'should produce the same value for a "String" that is already capitalized' do
      string = 'HelloWorld'
      string.capitalize.should == 'HelloWorld'
    end

  end

  describe 'to_camel_case' do

    it 'should produce an UpperCamelCase "String" by default' do
      string = 'hello_world'
      string.to_camel_case.should == 'HelloWorld'
    end

    it 'should produce a lowerCamelCase "String" if the lower argument is provided' do
      string = 'hello_world'
      string.to_camel_case(:lower => true).should == 'helloWorld'
    end

    it 'should produce the same value for a "String" that is already camel-cased' do
      string = 'HelloWorld'
      string.to_camel_case.should == 'HelloWorld'
    end

    it 'should be able to convert a lowerCamelCase "String" to an UpperCamelCase "String"' do
      string = 'helloWorld'
      string.to_camel_case.should == 'HelloWorld'
    end

    it 'should be able to convert an UpperCamelCase "String" to a lowerCamelCase "String"' do
      string = 'HelloWorld'
      string.to_camel_case(:lower => true).should == 'helloWorld'
    end

  end

  describe 'to_regexp' do

    it 'should produce a "Regexp" object' do
      string = 'hello world.'
      string.to_regexp.should == /hello world./
    end

    it 'should produce an escaped "Regexp" object when the escape option is specified' do
      string = 'hello world.^$'
      string.to_regexp(:escape => true).should == /hello\ world\.\^\$/
    end

  end

  describe 'to_snake_case' do

    it 'should be able to convert a lowerCamelCase "String" to snake_case' do
      string = 'helloWorld'
      string.to_snake_case.should == 'hello_world'
    end

    it 'should be able to convert an UpperCamelCase "String" to snake_case' do
      string = 'HelloWorld'
      string.to_snake_case.should == 'hello_world'
    end

    it 'should produce the same value for a "String" that is already snake_case' do
      string = 'hello_world'
      string.to_snake_case.should == 'hello_world'
    end

  end

  describe 'uncapitalize' do

    it 'should downcase the first letter and leave the rest of the "String" untouched' do
      string = 'HelloWorld'
      string.uncapitalize.should == 'helloWorld'
    end

    it 'should produce the same value for a "String" that is already uncapitalized' do
      string = 'helloWorld'
      string.uncapitalize.should == 'helloWorld'
    end

  end

end
