module UsersHelper

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

end
