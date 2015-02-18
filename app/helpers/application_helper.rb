module ApplicationHelper
  def form_auth
    <<-HTML.html_safe
      <input type="hidden"
             name="authenticity_token"
             value="#{ form_authenticity_token }">
    HTML
  end

  def put_action
    hidden_input("put")
  end

  def delete_action
    hidden_input("delete")
  end

  def render_errors
    errors = "<ul class=\"errors\">"

    flash[:errors].each do |error|
      errors << "<li>#{error}</li>"
    end

    errors << "</ul>"

    errors.html_safe
  end

  private
  def hidden_input(method)
    <<-HTML.html_safe
      <input type="hidden"
             name="_method"
             value="#{method}">
    HTML
  end
end
