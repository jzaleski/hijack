class Object
  def blank?
    nil? ||
      (respond_to?(:empty?) && empty?) ||
      !self
  end

  def presence
    self if present?
  end

  def present?
    !blank?
  end

  def try(*args, &block)
    # short-circuit immediately if "nil"
    return if nil?
    # no method name plus a block
    if args.empty? && block_given?
      yield self
    # explicit method name, possibly arguments, possibly a block
    else
      public_send(*args, &block)
    end
  end
end
