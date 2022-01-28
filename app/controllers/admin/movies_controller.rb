class Admin::MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def new
  end

  def create
    # 映画情報の新規作成画面
    @new_movie = Movie.new(
      name: params[:title],
      year: params[:year],
      is_showing: params[:is_showing].to_i == 1 ? true : false,
      description: params[:description],
      image_url: params[:image_url],
    )

    Rails.logger.debug @new_movie

    begin
      if @new_movie.save
        redirect_to("/movies")
      else
        flash[:notice] = '登録に失敗しました'
        Rails.logger.debug "フォームエラー"
      end
    rescue => exception
      flash[:notice] = '登録に失敗しました'
      Rails.logger.debug "登録に失敗しました"
    end


  end
end
