load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/thyrils_script.rb", true

class ThyrilsReturnScript < ThyrilsScript
  protected

  def directions
    reverse_directions(super)
  end
end
