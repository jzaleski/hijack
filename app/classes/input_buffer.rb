require 'classes/buffer'

class InputBuffer < Buffer
  protected

  def dedupe?
    @config.dedupe_input?
  end
end
