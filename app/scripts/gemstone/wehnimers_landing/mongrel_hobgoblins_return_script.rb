load "#{APP_DIR}/scripts/gemstone/wehnimers_landing/mongrel_hobgoblins_script.rb", true

class MongrelHobgoblinsReturnScript < MongrelHobgoblinsScript
  protected

  def directions
    reverse_directions(super)
  end
end
