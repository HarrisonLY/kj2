module UsersHelper

  def format_releasing_on_remaining(product)
    if product.tba?
      ""
    elsif product.out?
      "OUT"
    else
    (product.releasing_on - (DateTime.now - 2.day)).to_i
  end
end

end
