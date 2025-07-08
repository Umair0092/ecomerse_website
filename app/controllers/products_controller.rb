class ProductsController < ApplicationController
  allow_unauthenticated_access only: %i[index show]
  before_action :set_category, only: %i[create]
  def index
    puts params[:query]
    if params[:query].present?
       @products=Product.where("name=?", params[:query])

    else
       @products = Product.all
    end
    
  end
  def new
    @product = Product.new
  end
  def create
    #puts "#{params[cat]}"
    # @category = Category.find_by(name: params[:product][:category_id]) if params[:product][:category_id].present?
    # params[:product][:category_id] = @category.id if @category.present?
    @product = Product.new(product_params)
    @product.valid?
     puts "Errors inn creation: #{@product.errors.full_messages.join(", ")}"
    if @product.save
      redirect_to products_path, success: "Product Added successfully"
    else
      render :new, error: "Failed to add product"
    end
  end
  def show
    @product = Product.find(params[:id])
    @reviews=@product.reviews
  end
  def destroy
    @product = Product.find(params[:id])
    puts "Attempting to destroy product with ID: #{@product.id}"
    puts "Product details: #{@product.inspect}"
    if @product.destroy

      redirect_to products_path, notice: "Product deleted Successfully"
    else
      redirect_to products_path, notice: "Product deletion failed"
    end
  end
  def edit
   @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
     @category = Category.find_by(id: params[:product][:category_id]) if params[:product][:category_id].present?
     @product[:category_id]=@category.name
    if Current.session[:user_id]==@product.user_id
      if @product.update(product_params)
        redirect_to @product
      else
         render :edit, status: :unprocessable_entity
      end
    end
  end

  private
  def set_category
    puts "Setting category based on params: #{params[:product][:category_id].inspect}"
    @category = Category.find_by(name: params[:product][:category_id]) if params[:product][:category_id].present?
    puts "Category found: #{@category.inspect}" if @category.present?
    params[:product][:category_id] = @category.id if @category.present?
    params[:product][:user_id]= Current.session[:user_id] if Current.session[:user_id].present?
  end
  def product_params
    params.require(:product).permit(:name, :description, :price, :featured_image, :category_id, :user_id)
  end
end
