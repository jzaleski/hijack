require 'scripts/base/base_dragonrealms_get_script'

class GemScript < BaseDragonrealmsGetScript
  protected

  def config_container
    @config[:gem_container]
  end
end
