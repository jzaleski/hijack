load "#{APP_DIR}/scripts/base/base_dragonrealms_get_script.rb", true

class GetScript < BaseDragonrealmsGetScript
  protected

  def config_container
    @config[:get_container]
  end
end
