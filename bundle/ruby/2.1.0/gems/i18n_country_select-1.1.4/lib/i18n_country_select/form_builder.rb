module I18nCountrySelect
	module FormBuilder
		def country_code_select(method, priority_countries = nil, options = {}, html_options = {})
			@template.country_code_select(@object_name, method, priority_countries, options.merge(object: @object), html_options)
		end
	end
end
