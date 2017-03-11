load "#{SCRIPTS_DIR}/base/base_gemstone_script.rb", true

class AttackScript < BaseGemstoneScript
  def run
    stance_offensive
    loop do
      break unless attack
    end
    stance_defensive
  end
end
