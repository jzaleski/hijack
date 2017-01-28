load "#{APP_DIR}/scripts/gemstone/icemule_trace/community_well_script.rb", true

class ThurfelsKeepScript < CommunityWellScript
  protected

  def directions
    super + [
      DOWN,
      'go limb',
      DOWN,
      DOWN,
      DOWN,
      DOWN,
      DOWN,
      "#{DOWN}|go stair",
      DOWN,
      DOWN,
      "#{DOWN}|go flue",
      SOUTH,
      SOUTHEAST,
      SOUTHWEST,
      SOUTHEAST,
      DOWN,
      SOUTH,
      SOUTH,
      SOUTH,
      SOUTHEAST,
      'go bridge|go shore',
      SOUTH,
      SOUTHWEST,
      SOUTH,
      "climb stalagmite|#{UP}",
      SOUTH,
      SOUTHEAST,
      'go stones',
      EAST,
      NORTHEAST,
      NORTH,
      NORTHWEST,
      EAST,
      'go portcullis',
    ]
  end

  def location
    "thurfels_keep|#{ICEMULE_TRACE}"
  end
end
