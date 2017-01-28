load "#{APP_DIR}/scripts/gemstone/wehnimers_landing/skeletal_lords_script.rb", true

class SkeletalLordsReturnScript < SkeletalLordsScript
  protected

  def directions
    reverse_directions(super)
  end
end
