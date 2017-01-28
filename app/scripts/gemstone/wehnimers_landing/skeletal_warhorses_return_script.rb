load "#{APP_DIR}/scripts/gemstone/wehnimers_landing/skeletal_warhorses_script.rb", true

class SkeletalWarhorsesReturnScript < SkeletalWarhorsesScript
  protected

  def directions
    reverse_directions(super)
  end
end
