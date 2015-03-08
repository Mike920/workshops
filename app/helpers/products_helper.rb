module ProductsHelper
  def user_is_owner
    user_signed_in? && current_user.products.exists?(product)
  end
end
