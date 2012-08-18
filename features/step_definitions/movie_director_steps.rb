Then /^the director of "(.*)" should be "(.*)"$/ do |movie, director|
    Movie.find_by_title(movie).director.should == director
end

Then /^a new movie should be created with title "(.*)" and director "(.*)" and rating "(.*)"$/ do |title, director, rating|
  Movie.find_by_title_and_rating(title, rating).director.should == director
end

Then /^(?:|I )should see message "(([^"]*) was successfully created.)"$/ do |text, title|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end
