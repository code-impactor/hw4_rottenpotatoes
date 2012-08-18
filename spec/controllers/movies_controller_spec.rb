require "spec_helper"

describe MoviesController do
  it "Finds Similar Movies" do
    { :get => "find_similar_movies/1" }.should route_to(
      :controller => "movies",
      :action => "find_similar_movies",
      :id => "1"
    )
  end

  it "finds similar movies to the current movie" do
    movie = FactoryGirl.create :movie
    movie1 = FactoryGirl.create :movie, :title => "Predator"
    movie2 = FactoryGirl.create :movie, :title => "Alien"
    movie3 = FactoryGirl.create :movie, :title => "Alien", :director => "Banderas"

    get "find_similar_movies" , :id => movie.id
    assigns[:movie].should eq movie
    assigns[:movies].should eq( [movie,movie1, movie2] )
  end

  it "redirects when no movies found" do
    movie = FactoryGirl.create :movie, :director => nil
    get "find_similar_movies", :id => movie.id
    response.should redirect_to(home_url)
  end

end
