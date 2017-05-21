require 'rails_helper'

describe "User creates a new job" do
  scenario "a user can create a new job with an existing category" do
    company = create(:company)
    cat1, cat2, cat3 = create_list(:category, 3)
    visit new_company_job_path(company)

    fill_in "job[title]", with: "Developer"
    fill_in "job[description]", with: "So fun!"
    fill_in "job[level_of_interest]", with: 80
    fill_in "job[city]", with: "Denver"
    select cat3.title, from: "job[category_id]"

    click_button "Create"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{Job.last.id}")
    expect(page).to have_content(company.name)
    expect(page).to have_content("Developer")
    expect(page).to have_content("80")
    expect(page).to have_content("Denver")
    expect(page).to have_content(cat3.title)
  end
#As a user
#When I create a new job
#And I fill in a title
#And I fill in a description
#And I fill in a level of interest
#And I fill in a city
#And I select a category (required)
#And I click on Create
#I'll be redirected to that job specific page where I'll see all that information plus the company it's related to

  scenario "a user can add a new category and then create a new job" do
    job = create(:job)
    visit new_company_job_path(job.company)

    click_on "Add Category"
    expect(current_path).to eq(new_category_path)
    fill_in "category_title", with: "Finance"
    click_on "Create Category"

    expect(current_path).to eq("/companies/#{job.company.id}/jobs/new")
    fill_in "job[title]", with: "Developer"
    fill_in "job[description]", with: "So fun!"
    fill_in "job[level_of_interest]", with: 80
    fill_in "job[city]", with: "Denver"
    select "Finance", from: "job[category_id]"
    click_button "Create"

    expect(current_path).to eq("/companies/#{job.company.id}/jobs/#{Job.last.id}")
    expect(page).to have_content(job.company.name)
    expect(page).to have_content("Developer")
    expect(page).to have_content("80")
    expect(page).to have_content("Denver")
    expect(page).to have_content("Finance")
  end
end

#As a user
#When I create a new job
#And I fill in a title
#And I fill in a description
#And I fill in a level of interest
#And I fill in a city
#And I select a category (required)
# And I click on "New Category"
# And I fill in a title
# And I click on "Create Category"
# I'm redirected back to the form
# And I select my new category
#And I click on Create
#I'll be redirected to that job specific page where I'll see all that information plus the company it's related to