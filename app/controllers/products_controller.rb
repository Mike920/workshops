class ProductsController < ApplicationController

  include ProductsHelper
  before_action :authenticate_user!, only: [:update, :destroy, :create]
  expose(:category)
  expose(:categories)
  expose(:products)
  expose(:product)
  expose(:review) { Review.new }
  expose_decorated(:reviews, ancestor: :product)

  def index
  end

  def show
  end

  def new
  end

  def edit
    unless user_is_owner
      self.flash[:error] = 'You are not allowed to edit this product.'
      redirect_to(category_product_url(category, product))
    else
      render 'edit'
    end
  end

  def create
    self.product = Product.new(product_params)

    if product.save
      category.products << product
      current_user.products << product
      redirect_to category_product_url(category, product), notice: 'Product was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if not user_is_owner
      self.flash[:error] = 'You are not allowed to edit this product.'
      redirect_to(category_product_url(category, product))
    elsif self.product.update(product_params)
      redirect_to category_product_url(category, product), notice: 'Product was successfully updated.'
    else
      redirect_to category_product_url(category, product)
    end
  end

  # DELETE /products/1
  def destroy
    unless user_is_owner
      redirect_to category_url(product.category), notice: 'You are not allowed to edit this product.'
    else
      product.destroy
      redirect_to category_url(product.category), notice: 'Product was successfully destroyed.'
    end
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :category_id)
  end
end
