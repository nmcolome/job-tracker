require 'rails_helper'

describe "User creates a new category" do
  Category.create(title: "Marketing")
  scenario "user sees a page with the new Category" do
    skip
    visit categories_path
    visit new_category_path
    fill_in "category_title", with: "Finance"
    click_on "Create Category"

    expect(page).to have_content "Finance"
  end

  scenario "if category exists they'll see the form again" do
  Category.create(title: "Marketing")

    visit new_category_path
    fill_in "category_title", with: "Marketing"
    click_on "Create Category"

    expect(current_path).to eq(new_category_path)
  end
end

#As a user
#when I visit the new_category_form
#And I fill in the title
#And I click on create category
#I see a page with the Category title

#create a sad path (to include error message)