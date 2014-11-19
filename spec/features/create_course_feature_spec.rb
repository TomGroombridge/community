require 'spec_helper'

	describe 'create courses' do 
		
	context 'given a name and description' do 

		it 'should display the new course in the list of courses' do
			visit "/courses/new"
			fill_in 'Name', with: 'Sewing'
			fill_in 'Description', with: "come and try sewing"
			click_button 'submit'

			expect(current_path).to eq '/courses'
			expect(page).to have_content 'come and try sewing'
		end

	end

end