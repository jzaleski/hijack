class Buffer < Queue
	alias_method :gets, :deq
	alias_method :puts, :enq
end
