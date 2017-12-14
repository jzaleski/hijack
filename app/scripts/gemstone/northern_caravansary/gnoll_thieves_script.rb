load "#{SCRIPTS_DIR}/gemstone/northern_caravansary/gnoll_workers_script.rb", true

class GnollThievesScript < GnollWorkersScript
  protected

  def directions
    super + [
      EAST,
      EAST,
      SOUTH,
      lambda do
        sleep 0.1 until search
        true
      end,
      'go crevice',
      SOUTHEAST,
      'climb rubble',
      SOUTH,
      'climb rubble',
      SOUTHEAST,
      SOUTHEAST,
      EAST,
      'go bridge',
      'go path',
    ]
  end

  def location
    "gnoll_thieves|#{NORTHERN_CARAVANSARY}"
  end
end
