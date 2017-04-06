load "#{SCRIPTS_DIR}/gemstone/wehnimers_landing/shelfae_soldiers_script.rb", true

class ShelfaeChieftainsScript < ShelfaeSoldiersScript
  protected

  def location
    "shelfae_chieftains|#{WEHNIMERS_LANDING}"
  end
end
