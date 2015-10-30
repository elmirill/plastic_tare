class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :get_url_params
	before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy]
	before_action :get_all_products, only: [:new, :create, :edit, :update]
	before_action :get_all_types, only: [:new, :create, :edit, :update]

  # GET /products
  # GET /products.json
  def index
		@products = Product.search(params[:search]).filter_category(params[:filter_category]).filter_types(params[:types]).filter_volume(params[:minvol], params[:maxvol]).filter_length(params[:minlen], params[:maxlen]).filter_width(params[:minwid], params[:maxwid]).filter_height(params[:minheig], params[:maxheig]).filter_diameter(params[:mindiam], params[:maxdiam]).filter_cover(params[:cover]).order(params.fetch(:sort, "position ASC"))
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
        format.html { redirect_to @product, notice: 'Продукт успешно создан.' }
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
        format.html { redirect_to @product, notice: 'Продукт успешно обновлен.' }
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
      format.html { redirect_to products_url, notice: 'Продукт успешно удален.' }
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
      params.require(:product).permit(:name, :category, :length, :width, :height, :diameter, :inner_length, :inner_width, :inner_height, :inner_diameter, :volume, :net_volume, :weight, :side, :bottom, :types, :cover, :static_load, :dynamic_load, :rack_load, :capacity, :gallery, :description, :var_color, :var_color_price_1, :var_color_price_2, :var_color_price_3, :var_high, :var_high_price_1, :var_high_price_2, :var_high_price_3, :var_spec, :var_spec_price_1, :var_spec_price_2, :var_spec_price_3, :applications, :articul, :position, :featured, :campaign, :thumbnail, :delete_thumbnail, :category_id, :meta, :active, :meta_title, :meta_description, type_ids: [], related_product_ids: [], color: [], product_photos_attributes: [:id, :photo, :caption, :_destroy])
    end

  def get_url_params
    url_params = Rack::Utils.parse_query URI(request.original_url).query
    @curr_cat_id = url_params["filter_category"].to_i if url_params["filter_category"].present?
    @search_request = url_params["search"] if url_params["search"].present?
  end

  def get_type_names
    @type_names = Type.all.map{ |t| t.name }
  end
	
	def get_all_products
		@products = Product.all.order('name ASC')
	end
	
	def get_all_types
		@types = Type.all
	end
	

end
