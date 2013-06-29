module CasesHelper

  def render_violations_count ticket
    if ticket.violations.empty?
      content_tag :span, "0", class: "badge badge-success"
    else
      content_tag :span, ticket.violations.length, class: "badge badge-important"
    end
  end

  def render_index_actions html = String.new
    html << content_tag(:i, nil, class: "icon-delete")
    html << content_tag(:i, nil, class: "icon-edit")
    return html.html_safe
  end


end
