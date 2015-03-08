class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy, :create]

  expose(:category)
  expose(:product)
  expose(:review)
  expose_decorated(:reviews, ancestor: :product)
  def edit
  end

  def new
  end

  def create
    #self.review = Review.new(review_params)
    self.review = Review.new(review_params)
    current_user.reviews << review


    if review.save
      reviews << review
      redirect_to category_product_url(product.category, product), notice: 'Review was successfully created.'
    else
      render 'products/show'
    end

   # self.product = Product.find(params[:product_id])
  end

  def destroy
    review.destroy
    redirect_to category_product_url(product.category, product), notice: 'Review was successfully destroyed.'
  end

  private
    def review_params
      params.require(:review).permit(:content, :rating)
    end
end
