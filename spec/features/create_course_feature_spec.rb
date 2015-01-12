require 'spec_helper'

	describe 'create courses' do 

		before do 
			create(:admin)
			create(:course)			
		end
		
	

		it 'should display the new course in the list of courses' do
			visit "/"			
			expect(page).to have_content 'Learn to Bake Bread'
		end

end