load "#{SCRIPTS_DIR}/base/base_gemstone_script.rb", true

class IncantScript < BaseGemstoneScript
  def run
    spell = @args[0]
    return unless spell
    loop do
      stance_offensive
      break unless incant spell
      stance_guarded
      sleep 3.0
    end
    stance_defensive
  end
end
