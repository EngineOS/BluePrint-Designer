class Variable < ActiveRecord::Base

  belongs_to :variable_consumer, polymorphic: true

  validate :regex_validation, on: :update
  validate :value_confirmation_validation, on: :update
  validate :value_present_validation, on: :update

  def field_types
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

  def status
    if deprecated
      "<i class='fa fa-ban'></i>".html_safe
    elsif mandatory && !ask_at_build_time && value.blank?
      "<i class='fa fa-pencil'></i>".html_safe
    else
      "<i class='fa fa-check'></i>".html_safe
    end
  end

  def as_json(options={})
    options[:except] ||=
      [ 
        :created_at,
        :updated_at,
        :id,
        :record_label,
        :record_comment,
        :value_confirmation,
        :variable_consumer_id,
        :variable_consumer_type,
        :deprecated
      ]
    super
  end 

private

  def regex_validation
    if (mandatory == true && 
        ask_at_build_time == false &&
        regex_validator.present? &&
        !Regexp.new(regex_validator.to_s).match(value.to_s))
      errors.add(name, [label, regex_invalid_message] || [label, "is invalid. (Expects regex /#{regex_validator}/ but got `#{value}` from user.)"])
    end
  end

  def value_present_validation
    if (mandatory == true && ask_at_build_time == false && value.blank?)
      errors.add(name, [label, "must not be blank"])
    end
  end

  def value_confirmation_validation
    if (field_type == "password_with_confirmation" && value != value_confirmation)
      errors.add(name, ["Passwords", "must match"])
    end
  end

end
