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

  def certification_position_with_tooltip(certification)
    if certification.finished?
      content_tag(:span, certification.position.name, :class => 'finished', :title => certification.result)
    else
      certification.position.name
    end
  end
  
  def skill_type_with_tooltip(skill_type)
    if skill_type.comment.present?
      content_tag(:span, content_tag(:strong, skill_type), :title => skill_type.comment_to_html)
    else
      skill_type
    end    
  end
end
