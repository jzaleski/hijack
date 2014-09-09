require 'scripts/base/base_dragonrealms_get_script'

class GetScript < BaseDragonrealmsGetScript
  protected

  def config_container
    @config[:get_container]
  end
end
