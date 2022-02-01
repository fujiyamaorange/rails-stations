class Admin::MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    # 映画情報の新規作成画面
    @movie = Movie.new(
      name: params[:name],
      year: params[:year],
      is_showing: params[:is_showing].to_i == 1 ? true : false,
      description: params[:description],
      image_url: params[:image_url]
    )

    # @movie = Movie.new(movie_params)
    Rails.logger.debug @movie

    begin
      if @movie.save
        redirect_to("/admin/movies")
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

  def edit
    @movie = Movie.find_by(id: params[:id]) 
  end

  def update
    @movie = Movie.find_by(id: params[:id])
    @movie.name = params[:name]
    @movie.year = params[:year]
    @movie.is_showing = params[:is_showing].to_i == 1 ? true : false
    @movie.description = params[:description]
    @movie.image_url = params[:image_url]

    begin
      if @movie.save
        flash[:notice] = '映画情報を変更しました'
        redirect_to('/admin/movies')
      else
        Rails.logger.debug "400エラー発生"
        # 400エラーを返す？？
        redirect_to action: :edit, status: :found
      end
    rescue
      flash[:notice] = '変更に失敗しました'
      Rails.logger.debug "変更に失敗しました"
      redirect_to("/admin/movies/#{@move.id}")
    end
  end

  def destroy
    @movie = Movie.find_by(id: params[:id])

    begin
      if @movie.destroy
        flash[:notice] = '投稿を削除しました'
        redirect_to("/admin/movies")
      else
        flash[:notice] = '投稿の削除に失敗しました'
        redirect_to("/admin/movies")
      end
    rescue
      raise ActiveRecord::RecordNotFound
    end
    
  end
  
  # private
  # def movie_params
  #   params.require(:movie).permit(:name, :year, :is_showing, :description, :image_url)
  # end
 
end
