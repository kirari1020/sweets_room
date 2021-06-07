class SearchesController < ApplicationController
  
  def search
		@model = params[:model]
		@content = params[:content]
		@method = params[:method]
		if @model == 'user'
			records = User.search_for(@content, @method)
			@records = records.page(params[:page])
		else
			records = Post.search_for(@content, @method)
			@records = records.page(params[:page])
		end
	end
	
end
