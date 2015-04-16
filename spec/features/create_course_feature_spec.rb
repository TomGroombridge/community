require 'spec_helper'

	describe 'create courses' do

		let(:james) { create(:course) }

		before do
			create(:admin)
			create(:course)
			create(:course_address)
			create(:course_date)
			create(:ticket)
		end

		it 'should display the new course in the list of courses' do
			visit "/course_dates"
			expect(page).to have_content 'Learn to Bake Bread'
		end

		context 'given a course' do

			it "should be able to show a course date" do
				visit "/courses/1"
				expect(page).to have_content "Book Course"
			end
		end

end