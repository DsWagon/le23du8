class SearchController < ApplicationController
  def index
    @query = if params[:q].present?
    end
    @query = Post.ransack(params[:q])
    @posts = @query.result(distinct: true)
  end

end
