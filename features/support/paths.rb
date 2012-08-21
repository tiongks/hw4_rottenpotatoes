# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the home\s?page$/ then '/movies'
      '/'

    when /edit page for/ then begin
      # anchor_ref = page_name.match /edit page for\s\"(.*)\"/
      # page_ref = page.body.scan /\/movies\/(.*)\"(.*)#{anchor_ref[1]}/
      movie_title = page_name.match /edit page for\s\"(.*)\"/
      "/movies/" + Movie.find_by_title(movie_title[1]).id.to_s + "/edit"
    rescue Exception => e
      # raise "Error in mapping #{anchor_ref[1]}: " + "/movies/" + page_ref.to_s + "\npage.body:\n" + page.body
      raise "Error in mapping \"#{movie_title}\"."
    end

    when /movies\/\d/ then begin
      "movies/" + page_name
    end

    when /Similar Movies page for \"(.*)\"/ then '/movies/director'
    
    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
