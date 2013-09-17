class LayoutHelper

  def initialize(config)
    @config = config
  end

  def num_cols
    @num_cols ||= begin
      if @config.include?(:num_cols)
        @config[:num_cols].to_i
      elsif RUBY_PLATFORM =~ /mingw32/
        mode_parts = `mode con`.split
        mode_parts[mode_parts.index('Columns:') + 1].to_i
      else
        (STDIN.tty? ? `stty size`.split.last : `tput cols`).to_i
      end
    end
  end

  def num_rows
    @num_rows ||= begin
      if @config.include?(:num_rows)
        @config[:num_rows].to_i
      elsif RUBY_PLATFORM =~ /mingw32/
        mode_parts = `mode con`.split
        mode_parts[mode_parts.index('Lines:') + 1].to_i
      else
        (STDIN.tty? ? `stty size`.split.first : `tput rows`).to_i
      end
    end
  end

  def strip_ansi_escape_sequences?
    @strip_ansi_escape_sequences ||= begin
      if @config.include?(:strip_ansi_escape_sequences)
        @config[:strip_ansi_escape_sequences].to_s =~ /\Atrue\Z/
      elsif RUBY_PLATFORM =~ /mingw32/
        true
      else
        false
      end
    end
  end

end
