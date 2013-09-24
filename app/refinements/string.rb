class String

  # override the default implementation of "capitalize" to only upcase the first
  # character and leave the rest of the string untouched (rather than downcasing
  # everything after the first letter)
  def capitalize
    self[0].upcase + self[1..-1]
  end

  def to_camel_case(opts={})
    buffer = []
    split('_').each_with_index do |word, index|
      buffer << \
        (index == 0 && opts[:lower] == true ? word.uncapitalize : word.capitalize)
    end
    buffer.join
  end

  def to_regexp(opts={})
    # escape the "String" if the "escape" option is specified (and is "true")
    Regexp.new(opts[:escape] == true ? Regexp.escape(self) : self)
  end

  def to_snake_case
    # there are more robust solutions out there, but this seems to cover most
    # cases (revisit if necessary)
    gsub(/(.)([A-Z])/, '\1_\2').downcase
  end

  def uncapitalize
    self[0].downcase + self[1..-1]
  end

end
