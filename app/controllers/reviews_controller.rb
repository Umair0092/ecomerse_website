class ReviewsController < ApplicationController
  def index
    @reviews=Review.find_by(product_id: params[:product_id])
  end

  def new
    puts params[:product_id]
    @product=Product.find_by(id: params[:product_id])
    @review=Review.new
  end
  def create
    @product=Product.find_by(id: params[:product_id])
    puts "User_id:#{Current.session[:user_id]}"
    params[:review][:user_id]=Current.session[:user_id] if Current.session[:user_id].present?
    params[:review][:product_id]=params[:product_id]
    puts "params user_id #{params[:review][:user_id]}"

    @review = Review.new(set_params)
     respond_to do |format|
       if @review.save
         format.turbo_stream
         format.html { redirect_to @product, notice: "Review added successfully" }
       else
           redirect_to product_path(@product), success: "Review Added successfully"
       end
     end
     flash.now[:alert] = @review.errors.full_messages.join(", ")
     puts @review.errors.full_messages.join(", ")


    # if @review.save
    # redirect_to product_path(@product), notice: "Product added succesfully"
    # else
    # flash.now[:alert] = "Failed to add product"
    # flash.now[:alert] = @review.errors.full_messages.join(", ")
    # puts @review.errors.full_messages.join(", ")
    # render :new
    # end
  end

  def edit
     @review=Review.where("id=?", params[:id])
  end

  def update
    @review=Review.where("id=?", params[:id])
    if Current.session[:user_id]==@review.user_id
      if @review.update(set_params)
        redirect_to
      else
         render :edit, status: :unprocessable_entity
      end
    end
  end
  def destroy
    @review = Review.find(params[:id])
    if @review.destroy

      redirect_to root_path, method: :show, notice: "Review Deleted Successfully "
    else
      redirect_to products_path, notice: "Review deletion failed"
    end
  end
  private
  def set_params
    params.require(:review).permit(:user_id, :product_id, :comment, :rating)
  end
end
