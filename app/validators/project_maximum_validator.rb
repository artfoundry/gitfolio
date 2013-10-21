class ProjectMaximumValidator < ActiveModel::Validator
	def validate(record)
		unless record.developer.projects.count < 5
			record.errors[:project_max] << "You have reached the maximum number of projects allowed"
		end
	end
end