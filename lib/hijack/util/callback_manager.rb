require 'set'

class CallbackManager

  def initialize
    @callbacks = {}
  end

  def process(line)
    @callbacks.keys.each do |pattern|
      if line.match(pattern)
        @callbacks.delete(pattern).each do |callback|
          callback.call rescue nil
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
