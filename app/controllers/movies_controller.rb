class MoviesController < ApplicationController
  def index
    # モック
    # mock_movies = Array.new(6, {title: "ショーシャンクの空に", image: "https://imgc.nxtv.jp/img/info/tit/00003/SID0003844.png?output-format=jpg&output-quality=70&resize=1024:*"})
    # @movies = mock_movies
    @movies = Movie.all
  end
end


movie = Movie.new(name: "ショーシャンクの空に", year: "2022", description: "これはショーシャンクの空にです", image_url: "https://imgc.nxtv.jp/img/info/tit/00003/SID0003844.png?output-format=jpg&output-quality=70&resize=1024:*", is_showing: false, created_at: nil, updated_at: nil)