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

  def render_show_or_edit_link
    if params[:id]
      if params[:action].match("edit")
        content_tag :li, link_to("Status", case_path(params[:id]))
      else
        content_tag :li, link_to("Edit", edit_case_path(params[:id]))
      end
    end

  end


end
