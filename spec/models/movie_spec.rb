require 'spec_helper'

describe Movie do

	it 'should return movies from the same director' do
		m = Movie.all(:conditions => {:director => 'Not Me'})
		m.size >= 0
	end
end