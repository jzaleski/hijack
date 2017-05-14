class ArgumentsHelper
  def initialize(config)
    @config = config
  end

  def parse(str)
    [].tap do |args|
      in_double_quotes = false
      in_single_quotes = false
      tmp = ''
      # process the string one character at a time
      str.each_char do |c|
        # append the buffer (if it is not blank) when ending double-quotes
        if c == '"' && !in_single_quotes
          if in_double_quotes
            args << tmp unless tmp.blank?
            tmp = ''
          end
          in_double_quotes = !in_double_quotes
          next
        # append the buffer (if it is not blank) when ending single-quotes
        elsif c == "'" && !in_double_quotes
          if in_single_quotes
            args << tmp unless tmp.blank?
            tmp = ''
          end
          in_single_quotes = !in_single_quotes
          next
        # not in quotes, a space signifies the beginning of a new argument
        elsif c == ' ' && !in_double_quotes && !in_single_quotes
          args << tmp unless tmp.blank?
          tmp = ''
          next
        end
        # append the character to the end of the buffer
        tmp << c
      end
      # if there is anything else in the buffer  make sure that it is appended
      # to the result before returning
      args << tmp unless tmp.blank?
    end
  end
end
