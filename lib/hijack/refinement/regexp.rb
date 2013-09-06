class Regexp

  def union(*others)
    # validate that each of the others can be converted to or is a "Regexp" object
    raise 'All other elements must be or be convertable to "Regexp" objects' \
      unless others.all? {|element| element.is_a?(Regexp) || element.is_a?(String)}
    Regexp.union(self, *others)
  end

end
