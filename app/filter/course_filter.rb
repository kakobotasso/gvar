class CourseFilter
	def self.filter(options)
		if options
			scope = Course.where('active' => true).order("created_at")
		else
			[]
		end
	end
end