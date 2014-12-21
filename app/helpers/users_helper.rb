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

end
