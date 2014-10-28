module ApplicationHelper

def page_title
  if content_for?(:title)
    content_tag(:title, "Kijovo - #{content_for(:title)}")
  else
    content_tag(:title, "Kijovo | The Future At Your Fingertips")
  end
end
end