class Variable < ActiveRecord::Base

  belongs_to :variable_consumer, polymorphic: true
  # has_one :variable_setter, dependent: :destroy
  validates :name, presence: true

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
    ( name.present? ? name : '?' ) + ( ( ' = ' +  SharedViews.value_as_html(value) ) if value.present? ).to_s
  end

  def to_title
    variable_consumer_type.to_s.underscore.humanize + ' variable: ' + to_label
  end

end
