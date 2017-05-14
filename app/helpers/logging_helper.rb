class LoggingHelper
  def initialize(config)
    @config = config
    @stderr = config[:stderr] || STDERR
    @stdout = config[:stdout] || STDOUT
  end

  def debug(message)
    @stdout.puts(message)
  end

  def error(message)
    @stderr.puts(message)
  end

  def exception(exception)
    @stderr.puts "%s\n%s" % [
      exception_message(exception),
      backtrace(exception),
    ]
  end

  def info(message)
    @stdout.puts(message)
  end

  def warning(message)
    @stdout.puts(message)
  end

  private

  def backtrace(exception)
    exception.backtrace.map { |line| "\tfrom #{line}" }.join("\n")
  end

  def exception_message(exception)
    "\n#{exception.class}: #{exception.message}"
  end
end
