require 'hijack/script/share/get_script'

class GemScript < GetScript

  protected

  def config_container
    @config[:gem_container]
  end

end
