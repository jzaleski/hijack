class LayoutManager
	def self.num_cols
		@@num_cols ||= (STDIN.tty? ? `stty size`.split.last : `tput cols`).to_i
	end
	def self.num_rows
		@@num_rows ||= (STDIN.tty? ? `stty size`.split.first : `tput rows`).to_i
	end
end
