load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/mongrel_hobgoblins_script.rb", true

class MongrelHobgoblinsReturnScript < MongrelHobgoblinsScript
  protected

  def directions
    reverse_directions(super)
  end
end
