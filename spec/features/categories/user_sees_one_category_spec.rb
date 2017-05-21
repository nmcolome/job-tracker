require 'rails_helper'

describe "User can see a category page" do
  scenario "user sees a category-specific page" do
    category = create(:category, :with_jobs, job_count: 4)
    visit category_path(category)

    expect(page).to have_content category.title
    expect(page).to have_content category.jobs.first.title
    expect(page).to have_content category.jobs.last.title
    expect(category.jobs.count).to eq 4
  end
end

# As a user
# When I visit a page for a specific category
# I see the title of the category
# And a list of jobs in that category
