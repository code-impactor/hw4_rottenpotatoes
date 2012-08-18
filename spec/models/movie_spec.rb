require 'spec_helper'

describe Movie do
  it "should return all ratings" do
    Movie.all_ratings.should == %w(G PG PG-13 NC-17 R)
  end

  it "should return movies with the same director as given movie" do
    movie = FactoryGirl.create :movie
    movie1 = FactoryGirl.create :movie, :title => "Predator"
    movie2 = FactoryGirl.create :movie, :title => "Alien"
    movie3 = FactoryGirl.create :movie, :title => "Alien", :director => "Banderas"
    movie.find_movies_with_same_director.should be_include movie1
    movie.find_movies_with_same_director.should be_include movie2
    movie.find_movies_with_same_director.should_not be_include movie3
  end

  it "should return nil if movie has no director" do
    movie = FactoryGirl.create :movie, :director => nil
    movie.find_movies_with_same_director.should == nil
  end
end
