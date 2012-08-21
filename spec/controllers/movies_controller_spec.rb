require 'spec_helper'

describe MoviesController do

	describe 'it should list all relevant movies,' do

    it 'should show individual movie details' do
      Movie.should_receive(:find)
      post :show
    end

    it 'should sort by title' do
      get 'index', {:sort => 'title'}
    end

    it 'should sort by release date' do
      get 'index', {:sort => 'release_date'}
    end

    it 'should be able to create new movie entries' do
      post 'create'
    end

		it 'should have a route for finding movies by director' do
			post :index
    end

		it 'should invoke find_by_title in model' do
			Movie.should_receive(:find_by_title)
			post :index, {:movie_title => 'Alien'}
		end
		
	end
	
end