class Regexp
  def to_regexp(opts={})
    # added for API consistency, effectively a noop
    self
  end

  def union(*others)
    # validate that each of the `others` are, or can be converted to, `Regexp`
    # object(s)
    raise 'All other elements must be or be convertable to "Regexp" objects' \
      unless others.all? { |element| element.is_a?(Regexp) || element.is_a?(String) }
    Regexp.union(self, *others)
  end
end
