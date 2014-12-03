module ApplicationHelper


def all_user
	@all_user = current_user || current_member || current_course_provider
end

end
