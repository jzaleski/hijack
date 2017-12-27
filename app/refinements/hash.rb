class Hash
  def camel_case_keys(opts={})
    dup.camel_case_keys!(opts)
  end

  def camel_case_keys!(opts={})
    keys.each do |key|
      value = delete(key)
      if value.respond_to?(:camel_case_keys!)
        value.camel_case_keys!
      elsif value.respond_to?(:map!)
        value.map! { |element| element.camel_case_keys(opts) rescue element }
      end
      self[(key.to_camel_case(:lower => opts[:lower]) rescue key) || key] = \
        value
    end
    self
  end

  def method_missing(method, *args)
    method = method.to_s
    return self[method.chop.to_sym].true? \
      if method.end_with?('?') && args.empty?
    raise NoMethodError
  end

  def snake_case_keys
    dup.snake_case_keys!
  end

  def snake_case_keys!
    keys.each do |key|
      value = delete(key)
      if value.respond_to?(:snake_case_keys!)
        value.snake_case_keys!
      elsif value.respond_to?(:map!)
        value.map! { |element| element.snake_case_keys rescue element }
      end
      self[(key.to_snake_case rescue key) || key] = value
    end
    self
  end

  def stringify_keys
    dup.stringify_keys!
  end

  def stringify_keys!
    keys.each do |key|
      value = delete(key)
      if value.respond_to?(:stringify_keys!)
        value.stringify_keys!
      elsif value.respond_to?(:map!)
        value.map! { |element| element.stringify_keys rescue element }
      end
      self[(key.to_s rescue key) || key] = value
    end
    self
  end

  def symbolize_keys
    dup.symbolize_keys!
  end

  def symbolize_keys!
    keys.each do |key|
      value = delete(key)
      if value.respond_to?(:symbolize_keys!)
        value.symbolize_keys!
      elsif value.respond_to?(:map!)
        value.map! { |element| element.symbolize_keys rescue element }
      end
      self[(key.to_sym rescue key) || key] = value
    end
    self
  end
end
