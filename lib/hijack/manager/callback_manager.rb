class CallbackManager

  def initialize
    @callbacks = {}
  end

  def process(line)
    @callbacks.keys.each do |pattern|
      if match_data = line.match(pattern)
        # currently only a single-match is supported
        match = match_data[0]
        @callbacks.delete(pattern).each do |callback|
          callback.call(match) rescue nil
        end
      end
    end
  end

  def add_match(pattern, callback)
    # allow for multiple callbacks to match the same pattern (use a "Set" to
    # de-dupe)
    @callbacks[pattern] = (@callbacks[pattern] || Set.new) << callback
  end

end
