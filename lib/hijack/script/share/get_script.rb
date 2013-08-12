require 'hijack/script/base/base_get_script'

class GetScript < BaseGetScript

  protected

  def config_container
    @config[:get_container]
  end

end
