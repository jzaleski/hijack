require 'hijack/bridge/simutronics_bridge'

class BaseDragonrealmsBridge < SimutronicsBridge

  def gets
    line = super
    line.include?('***') ? '' : line
  end

end
