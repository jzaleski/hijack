load "#{SCRIPTS_DIR}/gemstone/icemule_trace/thurfels_keep_script.rb", true

class WallGuardiansScript < ThurfelsKeepScript
  protected

  def location
    "wall_guardians|#{ICEMULE_TRACE}"
  end
end
