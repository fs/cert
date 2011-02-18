module ApplicationHelper
  def title(page_title, show_title = true)
    @show_title = show_title
    content_for(:title) { page_title.to_s }
  end

  def show_title?
    @show_title
  end

  def certification_mark_with_tooltip(mark)
    if mark.comment.present?
      content_tag(:span, content_tag(:strong, mark.to_s), :title => mark.comment)
    else
      mark
    end
  end
end
