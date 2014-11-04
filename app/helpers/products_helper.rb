module ProductsHelper

def format_price(product)
  if product.tbd?
  "TBD"
  else
    number_to_currency(product.price)
  end
  end


def format_releasing_on(product)
  if product.tba?
  "TBA"
  else
      product.releasing_on
  end
  end

  def format_releasing_on_remaining(product)
    if product.tba?
      "?"
    elsif product.out?
      "OUT"
    else
    (product.releasing_on - DateTime.now).to_i
  end
end


def image_for(product)
  if product.image.exists?
    image_tag(product.image.url)
  else
    image_tag('placeholder_sneaker.png')
  end
end


end