load "#{SCRIPTS_DIR}/base/base_gemstone_script.rb", true

class LootScript < BaseGemstoneScript
  def run
    creature = @args[0] || config_creature
    loot(creature)
  end

  def validate_args
    @args.length == 1 || config_creature.present?
  end

  private

  def config_creature
    @config[:creature]
  end
end
