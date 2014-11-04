module ApplicationHelper

def page_title
  if content_for?(:title)
    content_tag(:title, "Kijovo - #{content_for(:title)}")
  else
    content_tag(:title, "Kijovo | The Future At Your Fingertips")
  end
end

def sortable(column, title = nil)
  title ||= column.titleize
  css_class = column == sort_column ? "current #{sort_direction}" : nil
  direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
  link_to title, {:sort => column, :direction => direction}, {:class => css_class}
end

end

