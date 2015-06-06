module ProductsHelper

def format_price(product)
  if product.tbd?
  "$TBD"
  else
    number_to_currency(product.price)
  end
  end


def format_releasing_on(product)
  if product.tba?
  "- TBA -"
  else
      product.releasing_on
  end
  end

  def format_releasing_on_remaining(product)
    if product.tba?
      "TBA"
    elsif product.out?
      "OUT"
    else
    (product.releasing_on - Date.current ).to_i
  end 
end  


def image_for(product)
  if product.image.exists?
    image_tag(product.image.url)
  else
    image_tag('placeholder_sneaker.png')
  end
end


  def embed(youtube_url)
    youtube_id = youtube_url.split("=").last
    content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}")
  end
  

# images for product


def picture_for(product)
  if product.picture.exists?
    image_tag(product.picture.url)
  else
  end
end

def picture1_for(product)
  if product.picture1.exists?
    image_tag(product.picture1.url)
  else
  end
end

def picture2_for(product)
  if product.picture2.exists?
    image_tag(product.picture2.url)
  else
  end
end

def picture3_for(product)
  if product.picture3.exists?
    image_tag(product.picture3.url)
  else
  end
end

def picture4_for(product)
  if product.picture4.exists?
    image_tag(product.picture4.url)
  else
  end
end

def picture5_for(product)
  if product.picture5.exists?
    image_tag(product.picture5.url)
  else
  end
end

def picture6_for(product)
  if product.picture6.exists?
    image_tag(product.picture6.url)
  else
  end
end

def picture7_for(product)
  if product.picture7.exists?
    image_tag(product.picture7.url)
  else
  end
end

def picture8_for(product)
  if product.picture8.exists?
    image_tag(product.picture8.url)
  else
  end
end

def picture9_for(product)
  if product.picture9.exists?
    image_tag(product.picture9.url)
  else
  end
end

  def embed(video)
     youtube_id = youtube_url.split("=").last
     content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}")
   end

end