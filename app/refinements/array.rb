class Array
  def to_regexp(opts={})
    # validate that there is at least one element
    raise 'Array must include at least one element' if empty?
    # validate that each element can be converted to or is a "Regexp" object
    raise 'All elements must be or be convertable to "Regexp" objects' \
      unless self.all? {|element| element.is_a?(Regexp) || element.is_a?(String)}
    # escape all "String" elements if the "escape" option is specified (this is
    # non-destructive)
    values = \
      if opts[:escape] == true
        self.map {|element| element.is_a?(String) ? Regexp.escape(element) : element}
      else
        self
      end
    Regexp.union(values)
  end
end
