class CallbackHelper

  def initialize
    @callbacks = {}
  end

  def process(str)
    @callbacks.keys.each do |pattern|
      if match_data = str.match(pattern)
        match = match_data[0]
        @callbacks.delete(pattern).each do |callback|
          callback.call(match) rescue nil
        end
      end
    end
  end

  def add_match(pattern, callback)
    # allow for multiple callbacks to match the same pattern
    @callbacks[pattern] = (@callbacks[pattern] || []) << callback
  end

end
