module ApplicationHelper

	def redcloth(text)
		if text.blank?
			return nil
		else
			return raw RedCloth.new(text).to_html
		end
	end

	def label_for_param(param_controller)
		param_controller.gsub("admin/", "").gsub("_", " ").titleize
	end

end
