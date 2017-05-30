class LoggingHelper
  def initialize(config)
    @config = config
    @stderr = config[:stderr] || STDERR
    @stdout = config[:stdout] || STDOUT
  end

  def debug(message, exception=nil)
    @stdout.puts(
      format_message(
        'DEBUG',
        message,
        exception
      )
    )
  end

  def error(message, exception=nil)
    @stderr.puts(
      format_message(
        'ERROR',
        message,
        exception
      )
    )
  end

  def exception(exception)
    error("#{exception.class}: #{exception.message}", exception)
  end

  def info(message, exception=nil)
    @stdout.puts(
      format_message(
        'INFO',
        message,
        exception
      )
    )
  end

  def warn(message, exception=nil)
    @stdout.puts(
      format_message(
        'WARN',
        message,
        exception
      )
    )
  end

  private

  def format_message(level, message, exception)
    message = "\n%s [%s]: %s" % [
      Time.now.strftime('%Y-%m-%d %H:%M:%S'),
      level,
      message,
    ]
    message += "\n#{(exception.backtrace || []).map { |line| "\tfrom #{line}" }.join("\n")}" \
      if exception.present?
    message
  end
end
