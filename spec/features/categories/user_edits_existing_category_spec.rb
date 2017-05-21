require 'rails_helper'

describe "User edits an existing category" do
  scenario "user sees the updated title in the index" do
    category = create(:category)

    visit categories_path
    click_on "Edit"
    fill_in "category_title", with: "Finance"
    click_on "Update Category"

    expect(current_path).to eq(category_path(category))
    expect(page).to have_content "Finance"
  end
end

# As a user
# When I visit the categories page
# And I click on Edit
# And I fill in a new title
# And I click on update category
# it takes me to the individual page of that category