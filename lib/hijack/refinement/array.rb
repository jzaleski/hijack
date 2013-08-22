class Array

  def to_regexp(opts={})
    # validate that there is at least one element
    raise 'Array must include at least one element' if self.empty?
    # validate that each of the elements can be converted to a "Regexp" object
    raise 'All Array elements must have a "to_regexp" method' \
      unless self.all? {|element| element.respond_to?(:to_regexp)}
    # convert each element to a "Regexp" object then union
    Regexp.union(self.map {|element| element.to_regexp(opts)})
  end

end
