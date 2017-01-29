load "#{SCRIPTS_DIR}/gemstone/skin_script.rb", true

class SkinAndSearchScript < SkinScript
  def run
    super
    creature = @args[0] || config_creature
    search_creature(creature)
  end

  private

  def config_creature
    @config[:creature]
  end
end
