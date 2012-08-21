require 'spec_helper'

describe MoviesController do

	describe 'it should search for movies with the same director' do
		it 'it should have a route for finding movies by director' do
			post :index
		end

		it ', controller should invoke find_by_title in model' do
			Movie.should_receive(:find_by_title)
			post :index, {:movie_title => 'Alien'}
		end
		
	end
	
end