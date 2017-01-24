class Symbol
  def to_regexp(opts={})
    self.to_s.to_regexp(opts)
  end
end
