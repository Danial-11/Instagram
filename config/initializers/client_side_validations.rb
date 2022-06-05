ActionView::Base.field_error_proc = proc do |html_tag, instance|
  if /^<label/.match?(html_tag)
    %(<div class=“field_with_errors1”>#{html_tag}</div>)
  else
    %(<div class=“field_with_errors”>#{html_tag}<label for=“#{instance.send(:tag_id)}”
      class=“message”>#{instance.error_message.first}</label></div>)
  end
end
