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
      self[(key.to_camel_case(opts) rescue key)] = value
    end
    self
  end

  def camel_case_values(opts={})
    dup.camel_case_values!(opts)
  end

  def camel_case_values!(opts={})
    keys.each do |key|
      value = delete(key)
      if value.respond_to?(:camel_case_values!)
        value.camel_case_values!
      elsif value.respond_to?(:map!)
        value.map! { |element| element.camel_case_values rescue element }
      elsif value.respond_to?(:to_camel_case)
        value = value.to_camel_case(:lower => opts[:lower])
      end
      self[key] = value
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
      self[(key.to_snake_case rescue key)] = value
    end
    self
  end

  def snake_case_values
    dup.snake_case_values!
  end

  def snake_case_values!
    keys.each do |key|
      value = delete(key)
      if value.respond_to?(:snake_case_values!)
        value.snake_case_values!
      elsif value.respond_to?(:map!)
        value.map! { |element| element.snake_case_values rescue element }
      elsif value.respond_to?(:to_snake_case)
        value = value.to_snake_case
      end
      self[key] = value
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
      self[(!key.nil? ? key.to_s : nil)] = value
    end
    self
  end

  def stringify_values
    dup.stringify_values!
  end

  def stringify_values!
    keys.each do |key|
      value = delete(key)
      if value.respond_to?(:stringify_values!)
        value.stringify_values!
      elsif value.respond_to?(:map!)
        value.map! { |element| element.stringify_values rescue element }
      elsif !value.nil?
        value = value.to_s
      end
      self[key] = value
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
      self[(key.to_sym rescue key)] = value
    end
    self
  end

  def symbolize_values
    dup.symbolize_values!
  end

  def symbolize_values!
    keys.each do |key|
      value = delete(key)
      if value.respond_to?(:symbolize_values!)
        value.symbolize_values!
      elsif value.respond_to?(:map!)
        value.map! { |element| element.symbolize_values rescue element }
      elsif value.respond_to?(:to_sym)
        value = value.to_sym
      end
      self[key] = value
    end
    self
  end
end
