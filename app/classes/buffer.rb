class Buffer
  def initialize(config)
    @config = config
    @queue = Queue.new
    @set = Set.new
  end

  def gets
    @queue.deq.tap { |value| @set.delete(value) if dedupe? }
  end

  def length
    @queue.length
  end

  def puts(value)
    @queue.enq(value) if !dedupe? || @set.add?(value)
  end

  protected

  def dedupe?
    false
  end
end
