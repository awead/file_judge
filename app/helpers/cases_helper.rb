module CasesHelper

  def render_violations_count ticket
    content_tag :span, ticket.violations.length, class: "badge badge-important"
  end

  def render_verdict filecase
    if filecase.verdict.nil?
      content_tag :span, "jury's still out", class: "label"
    else
      html_class = filecase.verdict.match(/^guilty$/) ? "label-important" : "label-success"
      content_tag :span, filecase.verdict, class: "label "+html_class
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