class LayoutManager

  def self.num_cols
    @@num_cols ||= begin
      if RUBY_PLATFORM =~ /mingw32/
        mode_parts = `mode con`.split
        mode_parts[mode_parts.index('Columns:') + 1].to_i
      else
        (STDIN.tty? ? `stty size`.split.last : `tput cols`).to_i
      end
    end
  end

  def self.num_rows
    @@num_rows ||= begin
      if RUBY_PLATFORM =~ /mingw32/
        mode_parts = `mode con`.split
        mode_parts[mode_parts.index('Lines:') + 1].to_i
      else
        (STDIN.tty? ? `stty size`.split.first : `tput rows`).to_i
      end
    end
  end

end
