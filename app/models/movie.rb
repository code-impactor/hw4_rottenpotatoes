class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  def find_movies_with_same_director
    if self.director && !self.director.empty?
      Movie.find_all_by_director(self.director)
    else
      nil
    end
  end
end
