module SharedViews

  def self.resolve_value_for item, attribute, opts={}

    label_method = opts[:label_method].present? ? opts[:label_method].to_sym : :to_s
    attribute = attribute.to_sym

    result = item.send(attribute)
    if result.class.superclass == ActiveRecord::Associations::CollectionProxy
      if result.count > 5
        overflow_count = result.count - 5
      end 
      result = result.map{|record|record.send(label_method)}.first(5).join(', ').html_safe 
      result += " + #{overflow_count} more" if overflow_count
    elsif result.class.superclass == ActiveRecord::Base 
      result = result.send(label_method)
    end 
    result
  end

end