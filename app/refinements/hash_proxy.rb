class HashProxy
  def initialize(hash={})
    @hash = hash
  end

  def ==(other)
    other.is_a?(HashProxy) &&
    @hash == other.instance_variable_get(:@hash)
  end

  def [](key)
    @hash[key.to_sym]
  end

  def []=(key, value)
    @hash[key.to_sym] = value
  end

  def delete(key)
    @hash.delete(key.to_sym)
  end

  alias_method :reset, :delete

  def fetch(key)
    @hash.fetch(key.to_sym)
  end

  alias_method :get, :fetch

  def include?(key)
    @hash.include?(key.to_sym)
  end

  def merge!(hash_or_hash_proxy)
    if hash_or_hash_proxy.is_a?(HashProxy)
      @hash.merge!(hash_or_hash_proxy.instance_variable_get(:@hash))
    else
      @hash.merge!(hash_or_hash_proxy)
    end
  end

  def store(key, value)
    @hash.store(key.to_sym, value)
  end

  alias_method :set, :store
end
