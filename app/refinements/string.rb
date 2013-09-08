class String

  def to_regexp(opts={})
    # escape the "String" if the "escape" option is specified (this is
    # non-destructive)
    value = \
      if opts[:escape] == true
        Regexp.escape(self)
      else
        self
      end
    Regexp.new(value)
  end

end
