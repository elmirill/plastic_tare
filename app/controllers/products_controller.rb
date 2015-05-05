class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_filter :get_url_params, :get_type_names, :get_application_names

  # GET /products
  # GET /products.json
  def index
    @products = Product.includes(:types).includes(:applications).search(params[:search]).filter_category(params[:filter_category]).filter_type(params[:filter_type]).filter_application(params[:filter_application])
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :short_description, :gallery, :size, :size_with_cover, :cover_size, :capacity, :volume, :net_volume, :parameters, :color, :var_color, :var_color_price_1, :var_color_price_2, :var_color_price_3, :var_high, :var_high_price_1, :var_high_price_2, :var_high_price_3, :var_spec, :var_spec_price_1, :var_spec_price_2, :var_spec_price_3, :featured)
    end

  def get_url_params
    url_params = Rack::Utils.parse_query URI(request.original_url).query
    @curr_cat_id = url_params["filter_category"] if url_params["filter_category"].present?
  end

  def get_type_names
    @type_names = Type.all.map{ |t| t.name }
  end

  def get_application_names
    @application_names = Application.all.map{ |t| t.name }
  end
end
