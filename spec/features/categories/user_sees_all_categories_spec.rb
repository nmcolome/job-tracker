require 'rails_helper'

describe "User sees all categories" do
  scenario "a user sees all the categories" do
    cat1, cat2, cat3, cat4, cat5, cat6 = create_list(:category, 6)

    visit categories_path

    expect(page).to have_content cat1.title
    expect(page).to have_content cat6.title
  end
end

# As a user
# when I visit the categories page
# I can see all the categories available in a single page