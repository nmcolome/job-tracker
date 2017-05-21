require 'rails_helper'

describe "User deletes a category" do
  scenario "they delete a category from the index" do
    category = create(:category)

    visit categories_path
    click_on "Delete"

    expect(page).not_to have_content category.title
  end
end

# As a user
# when I visit the categories page
# and I click on "Delete" of a category
# I delete it from the index