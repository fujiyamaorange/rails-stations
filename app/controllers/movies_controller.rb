class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    @query = params[:query]
    @state = params[:state]

    # ラジオボタンでの絞り
    selected = Movie.all
    if params[:state].present? && params[:state] != 'all'
      selected = @movies.where(is_showing: params[:state] == 'open' ? true : false) 
    else
      @state = 'all'
    end

    # キーワードでの絞り
    @searched = selected.where("name LIKE?", "%#{@query}%").or(selected.where("description LIKE?", "%#{@query}%"))

  end
end
