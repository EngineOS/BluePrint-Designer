class ServiceConfigurationVariable < ActiveRecord::Base

  belongs_to :service_configuration
  has_one :variable, as: :variable_consumer, dependent: :destroy

  validate :regex_validation, on: :update
  # validate :value_confirmation_validation, on: :update
  validate :value_present_validation, on: :update

  accepts_nested_attributes_for :variable


  # def field_types
  #   { :Text => :text_field,
  #     :Number => :number_field,
  #     :Password => :password,
  #     :'Password with confirmation' => :password_with_confirmation,
  #     :'Select dropdown' => :select,
  #     :'Radio buttons' => :radio_buttons,
  #     :Checkbox => :checkbox,
  #     :'Country select dropdown' => :country_select,
  #     :'Hidden' => :hidden_field }
  # end

  # def status
  #   if deprecated
  #     "<i class='fa fa-ban'></i>".html_safe
  #   elsif mandatory && !ask_at_build_time && value.blank?
  #     "<i class='fa fa-pencil'></i>".html_safe
  #   else
  #     "<i class='fa fa-check'></i>".html_safe
  #   end
  # end

  # def as_json(options={})
  #   if variable_consumer_type == 'BlueprintVersion'
  #     options[:except] ||=
  #       [ 
  #         :created_at,
  #         :updated_at,
  #         :id,
  #         :value_confirmation,
  #         :variable_consumer_id,
  #         :variable_consumer_type,
  #         :deprecated
  #       ]
  #     super
  #   else
  #     result = {}
  #     result[name] = value
  #     result
  #   end 
  # end 

  # def to_handle
  #   name.downcase.gsub(' ', '_')
  # end

  def to_label
    variable.to_label
  end

private

  def regex_validation
    if (variable.mandatory == true && 
        variable.ask_at_build_time == false &&
        variable.regex_validator.present? &&
        !Regexp.new(variable.regex_validator.to_s).match(variable.value.to_s))
      regex_invalid_message = variable.regex_invalid_message || "is invalid. (Regex /#{variable.regex_validator}/ does not match `#{variable.value}`.)"
      errors.add(variable.name, [variable.label, regex_invalid_message])
    end
  end

  def value_present_validation
    if (variable.mandatory == true && variable.ask_at_build_time == false && variable.value.blank?)
      errors.add(variable.name, [variable.label, "must not be blank"])
    end
  end

  def value_confirmation_validation
    if (variable.field_type == "password_with_confirmation" && variable.value != variable.value_confirmation)
      errors.add(variable.name, ["Passwords", "must match"])
    end
  end

end
