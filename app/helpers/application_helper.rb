module ApplicationHelper
    def display_form_error_messages(resource, field_name)
        if resource.errors.any? && resource.errors.messages[field_name].any?
          content_tag(:div, class: 'error-messages alert alert-danger') do
            resource.errors.full_messages_for(field_name).join(', ')
          end
        end
      end
end
