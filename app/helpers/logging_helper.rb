class LoggingHelper
  def initialize(opts={})
    @exception_log = opts[:exception_log] || STDERR
  end

  def log_exception_with_backtrace(exception)
    @exception_log.puts "%s\n%s" % [
      message(exception),
      backtrace(exception),
    ]
  end

  private

  def backtrace(exception)
    exception.backtrace.map { |line| "\tfrom #{line}" }.join("\n")
  end

  def message(exception)
    "\n#{exception.class}: #{exception.message}"
  end
end
