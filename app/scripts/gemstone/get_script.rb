load "#{SCRIPTS_DIR}/base/base_gemstone_get_script.rb", true

class GetScript < BaseGemstoneGetScript
  protected

  def config_container
    @config[:get_container]
  end
end
