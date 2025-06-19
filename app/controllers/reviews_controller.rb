class ReviewsController < ApplicationController
  def index
    @reviews=Review.find_by(product_id: params[:product_id])
  end

  def new
    @reviews=Review.new
  end
  def create
    params[:user_id]=session[:user_id] if session[:user_id].present?
  end

  def edit
     @review=Review.where("id=?", params[:id])
  end

  def update
    @review=Review.where("id=?", params[:id])
    if session[:user_id]==@review.user_id
      if @review.update(set_params)
        redirect_to @review
      else
         render :edit, status: :unprocessable_entity
      end
    end
  end
  private
  def set_params
    params.require(:review).permit(:id, :user_id, :product_id, :comment, :rating)
  end
end
