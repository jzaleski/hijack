class GameHelper
  def available_games
   Dir.entries(BRIDGES_DIR).reject { |entry| GAMES_TO_IGNORE.include?(entry) }
  end

  private

  GAMES_TO_IGNORE = %w[
    .
    ..
    base
  ]
end
