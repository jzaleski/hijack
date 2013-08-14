class LayoutManager

  DEFAULT_NUM_COLS = 125
  DEFAULT_NUM_ROWS = 35

  def self.num_cols
    @@num_cols ||= (STDIN.tty? ? `stty size`.split.last : `tput cols`).to_i rescue DEFAULT_NUM_COLS
  end

  def self.num_rows
    @@num_rows ||= (STDIN.tty? ? `stty size`.split.first : `tput rows`).to_i rescue DEFAULT_NUM_ROWS
  end

end
