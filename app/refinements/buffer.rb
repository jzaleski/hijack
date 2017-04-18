class Buffer
  def initialize
    @queue = Queue.new
  end

  def gets
    @queue.deq
  end

  def puts(value)
    @queue.enq(value)
  end
end
