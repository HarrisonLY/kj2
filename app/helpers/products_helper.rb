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
    else
    (product.releasing_on - DateTime.now).to_i
    #unless product.releasing_on < Time.now
     #"OUT"
    #end
  end
end

def image_for(product)
  if product.image_file_name.blank?
    image_tag('placeholder.png')
  else
    image_tag(product.image_file_name)
  end
end


end