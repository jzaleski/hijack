load "#{SCRIPTS_DIR}/dragonrealms/crossing/bank_script.rb", true

class FurrierScript < BankScript
  protected

  def directions
    [
      NORTHWEST,
      NORTH,
      NORTH,
      NORTH,
      NORTH,
      NORTH,
      NORTH,
      WEST,
      WEST,
      NORTH,
      NORTH,
      WEST,
      "go shed|#{OUT}"
    ]
  end

  def location
    "furrier|#{CROSSING}"
  end
end
