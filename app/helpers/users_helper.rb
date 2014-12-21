module UsersHelper

  def format_releasing_on_remaining(product)
    if product.tba?
      "TBA"
    elsif product.out?
      "OUT"
    else
    (product.releasing_on - Date.current).to_i
  end
end

  def embed(youtube_url)
    youtube_id = youtube_url.split("=").last
    content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}")
  end

end
