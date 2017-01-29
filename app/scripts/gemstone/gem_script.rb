load "#{SCRIPTS_DIR}/base/base_gemstone_get_script.rb", true

class GemScript < BaseGemstoneGetScript
  protected

  def config_container
    @config[:gem_container]
  end
end
