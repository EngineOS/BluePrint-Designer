class Variable < ActiveRecord::Base

  belongs_to :variable_consumer, polymorphic: true

  validate :regex_validation
  validate :value_confirmation_validation
  validate :value_present_validation

  def types
    { :Text => :text_field,
      :Number => :number_field,
      :Password => :password,
      :'Password with confirmation' => :password_with_confirmation,
      :'Select dropdown' => :select,
      :'Radio buttons' => :radio_buttons,
      :Checkbox => :checkbox,
      :'Country select dropdown' => :country_select,
      :'Hidden' => :hidden_field }
  end

private

  def regex_validation
    if (regex_validator.present? && !Regexp.new(regex_validator.to_s).match(value.to_s))
      errors.add(name, [label, regex_invalid_message] || [label, "is invalid. (Expects regex /#{regex_validator}/ but got `#{value}` from user.)"])
    end
  end

  def value_present_validation
    if (mandatory == true && value.blank?)
      errors.add(name, [label, "must not be blank"])
    end
  end

  def value_confirmation_validation
    if (type == "password_with_confirmation" && value != value_confirmation)
      errors.add(name, ["Passwords", "must match"])
    end
  end

end
