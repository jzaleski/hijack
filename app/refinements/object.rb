class Object

  def blank?
    nil? || (respond_to?(:empty?) && empty?) || !self
  end

  def presence
    self if present?
  end

  def present?
    !blank?
  end

end
