class ComparisonItemsController < ApplicationController
	before_action :set_comparison
	before_action :set_comparison_item, only: :destroy
	
  def create
		@comparison_item = @comparison.comparison_items.new(comparison_item_params)
    @comparison.save
		session[:comparison_id] = @comparison.id
  end

  def destroy
		@comparison_item.destroy
		@comparison_items = @comparison.comparison_items
  end
	
	private
	
	def set_comparison
		@comparison = current_comparison
	end
	
	def set_comparison_item
		@comparison_item = @comparison.comparison_items.find(params[:id])
	end
	
	def comparison_item_params 				
		params.require(:comparison_item).permit(:product_id)
	end
end
