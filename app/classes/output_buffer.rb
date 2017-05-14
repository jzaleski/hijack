require 'classes/buffer'

class OutputBuffer < Buffer
  protected

  def dedupe?
    @config.dedupe_output?
  end
end
