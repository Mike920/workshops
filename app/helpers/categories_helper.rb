module CategoriesHelper
  def active(cat)
     if category!=nil && category.name==cat.name
       'active'
     else
       ''
     end
  end

  def user_is_owner
    user_signed_in? && current_user.products.exists?(product)
  end
end
