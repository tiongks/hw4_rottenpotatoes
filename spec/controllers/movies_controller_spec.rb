require 'spec_helper'

describe MoviesController do

	describe 'it should list all relevant movies,' do

    before(:each) do
      Movie.stub!(:find).with("1").and_return(Movie.new)
      Movie.stub!(:update).with("1").and_return(true)
    end

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

    it 'should be able to update movie records' do
      put :update, :id => "1"
    end

    it 'should be able to search a movie for editing' do
      put :edit, :id => "1"
    end

    it 'should be able to delete records' do
      put :destroy, :id => "1"
    end

		it 'should have a route for finding movies by director' do
			post :index
    end

    it 'should find movies by rating' do
      post :index, {"ratings"=> {"G" => "1", "R" => "1"}}
    end

		it 'should invoke find_by_title in model' do
			Movie.should_receive(:find_by_title)
			post :index, {:movie_title => 'No Director'}
      Movie.should_receive(:find_all_by_director)
      movie = Movie.new
      movie.title = "Star Wars"
      movie.director = "George Lucas"
      Movie.stub!(:find_by_title).with("Star Wars").and_return(movie)
      post :index, {:movie_title => 'Star Wars'}
		end
		
	end
	
end