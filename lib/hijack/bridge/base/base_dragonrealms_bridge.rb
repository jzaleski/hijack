require 'hijack/bridge/base/base_simutronics_bridge'

class BaseDragonrealmsBridge < BaseSimutronicsBridge

  def gets
    line = super
    line.include?('***') ? '' : line
  end

end
