module ApplicationHelper
  def form_auth
    <<-HTML.html_safe
      <input type="hidden"
             name="authenticity_token"
             value="#{ form_authenticity_token }">
    HTML
  end

  def render_errors
    if flash[:errors]
      errors = "<ul class=\"errors\">"

      flash[:errors].each do |error|
        errors << "<li>#{error}</li>"
      end

      errors << "</ul>"

      errors.html_safe
    end
  end
end
