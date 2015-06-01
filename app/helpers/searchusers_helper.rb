module SearchusersHelper
  def model_fields
    # which fields to display and sort by
    [:first_name, :last_name, :email]
  end
  
  def display_query_sql(users)
    "SQL: #{users.to_sql}"
  end
  
  def action
    action_name == 'basic_search' ? :post : :get
  end
  
  def display_sort_column_headers(search)
    model_fields.each_with_object('') do |field, string|
      string << content_tag(:th, sort_link(search, field, {}, method: action))
    end
  end
  
  def display_search_results(objects)
    objects.each_with_object('') do |object, string|
      string << content_tag(:tr, display_search_results_row(object))
    end
  end
  
  def display_search_results_row(object)
    model_fields.each_with_object('') do |field, string|
      string << content_tag(:td, object.send(field))
      # button to link to profile link_to
    end
    .html_safe
  end
end

