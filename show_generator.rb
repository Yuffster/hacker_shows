class ShowGenerator

	def initialize

		@lists = {}

		Dir.glob('lists/*') do |f|
			@lists[f.split('/').pop] = File.read(f).split("\n")
		end

	end

	def expandText title

		title.scan(/{{(\w*)}}/).each do |m|
			m = m[0]
			throw "No list for "+m if (!@lists[m])
			replacement = expandText @lists[m].sample
			title.sub! '{{'+m.to_s+'}}', replacement
		end

		title

	end

	def getTitle
		expandText @lists['title'].sample
	end

	def getNetwork
		# I haven't had a TV in a very long time, so these networks might be
		# outdated.
		['The History Channel', "TLC", "Discovery", "SyFy", "TruTV", "Fox",
		 "The CW", "CBS", "TNT", "NBC"].sample
	end

end