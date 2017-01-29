load "#{SCRIPTS_DIR}/base/base_dragonrealms_get_script.rb", true

class GemScript < BaseDragonrealmsGetScript
  protected

  def config_container
    @config[:gem_container]
  end
end
