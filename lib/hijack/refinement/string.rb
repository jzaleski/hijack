class String

  def to_regexp(opts={})
    # clone the string
    value = "#{self}"
    # conditionally escape the string
    value = Regexp.escape(value) if opts[:escape] == true
    # construct a new Regexp object and return it to the caller
    Regexp.new(value)
  end

end
