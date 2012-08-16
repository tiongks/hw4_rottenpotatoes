# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |m|
    Movie.create [:title => m['title'], :rating => m['rating'], :release_date => m['release_date']]
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
  end
  @numrows = Movie.count
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.content  is the entire content of the page as a string.
  #  puts page.body
  table_elements = (page.body.scan /<td>(...*)<\/td>/).to_a.flatten
  #  Might need to comment out the 2 assertions that checks for nil before sumbitting to coursera SaaS class
  assert !table_elements.index(e1).nil?, "Unable to find #{e1}"
  assert !table_elements.index(e2).nil?, "Unable to find #{e2}"
  assert table_elements.index(e1) <= table_elements.index(e2)
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  rating_list.split(', ').each do |rating|
    uncheck.nil? ? check("ratings[#{rating}]") : uncheck("ratings[#{rating}]");
  end
end

Then /I should see all of the movies/ do 
  assert page.all('table#movies tr').count - 1 == @numrows
end

Then /I should not see any of the movies/ do
  assert page.all('table#movies tr').count == 1
end