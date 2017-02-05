load "#{SCRIPTS_DIR}/gemstone/skin_script.rb", true

class SkinAndLootScript < SkinScript
  def run
    super
    loot(creature)
  end
end
