class Hash
  def camel_case_keys(opts={})
    dup.camel_case_keys!(opts)
  end

  def camel_case_keys!(opts={})
    keys.each do |key|
      value = delete(key)
      self[(key.to_camel_case(:lower => opts[:lower]) rescue key) || key] = \
        value.respond_to?(:camel_case_keys) ? value.camel_case_keys(opts) : value
    end
    self
  end

  def snake_case_keys
    dup.snake_case_keys!
  end

  def snake_case_keys!
    keys.each do |key|
      value = delete(key)
      self[(key.to_snake_case rescue key) || key] = \
        value.respond_to?(:snake_case_keys) ? value.snake_case_keys : value
    end
    self
  end

  def symbolize_keys
    dup.symbolize_keys!
  end

  def symbolize_keys!
    keys.each do |key|
      value = delete(key)
      self[(key.to_sym rescue key) || key] = \
        value.respond_to?(:symbolize_keys) ? value.symbolize_keys : value
    end
    self
  end
end
