class Admin::MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    # 映画情報の新規作成画面
    # @movie = Movie.new(
    #   name: params[:name],
    #   year: params[:year],
    #   is_showing: params[:is_showing].to_i == 1 ? true : false,
    #   description: params[:description],
    #   image_url: params[:image_url]
    # )
    
    @movie = Movie.new(movie_params)
    Rails.logger.debug @movie

    begin
      if @movie.save
        redirect_to("/movies")
      else
        flash[:notice] = '登録に失敗しました'
        redirect_to("/admin/movies/new")
        Rails.logger.debug "フォームエラー"
      end
    rescue
      flash[:notice] = '登録に失敗しました'
      Rails.logger.debug "登録に失敗しました"
      redirect_to("/admin/movies/new")
    end
  end

  private
  def movie_params
    params.require(:movie).permit(:name, :year, :is_showing, :description, :image_url)
  end
 
end
