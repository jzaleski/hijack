require 'scripts/base/base_gemstone_get_script'

class GemScript < BaseGemstoneGetScript
  protected

  def config_container
    @config[:gem_container]
  end
end
