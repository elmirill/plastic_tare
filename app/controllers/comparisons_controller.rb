class ComparisonsController < ApplicationController
  def show
		@comparison_items = current_comparison.comparison_items
#		@products_transposed = @comparison_items.map { |ci| ci.product }.transpose
  end
	
	def empty
		ComparisonItem.where(comparison_id: current_comparison.id).delete_all
		flash[:notice] = "Сравнение товаров очищено"
		redirect_to comparison_path
	end
end
