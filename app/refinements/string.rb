class String

  # handle blank a bit differently for "String(s)" (a String consisting of only
  # whitespace characters is considered blank)
  def blank?
    !!(self =~ /\A\s*\Z/)
  end

  # override the default implementation of "capitalize" to only upcase the first
  # character and leave the rest of the string untouched (rather than downcasing
  # everything after the first letter)
  def capitalize
    self[0].upcase + self[1..-1]
  end

  def gchomp(separator=$/)
    dup.gchomp!(separator) || self
  end

  def gchomp!(separator=$/)
    gsub!(/#{separator}+\Z/, '')
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
    gsub(/::/, '/').
    gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2').
    gsub(/([a-z\d])([A-Z])/, '\1_\2').
    tr('-', '_').
    downcase
  end

  def uncapitalize
    self[0].downcase + self[1..-1]
  end

end
