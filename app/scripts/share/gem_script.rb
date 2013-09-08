require 'scripts/base/base_get_script'

class GemScript < BaseGetScript

  protected

  def config_container
    @config[:gem_container]
  end

end
