require 'scripts/base/base_gemstone_get_script'

class GetScript < BaseGemstoneGetScript
  protected

  def config_container
    @config[:get_container]
  end
end
