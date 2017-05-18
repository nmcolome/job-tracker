require 'rails_helper'

describe "User deletes a job posting" do
  scenario "user is redirected to company's job listing" do
    company = Company.create!(name: "ESPN")
    job1 = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    job2 = company.jobs.create!(title: "QA Analyst", level_of_interest: 70, city: "New York City")

    visit "companies/#{company.id}/jobs"
    click_on job1.title
    click_on "Delete"

    expect(current_path).to eq(company_jobs_path(company))
    expect(page).to_not have_content job1.title
  end
end

#user story
#as a user
#given that a company and related jobs exist
#when I visit the company job index
#and I click on a job
#and I click on Delete
#it will redirect me to the company job index
#and the job I deleted won't be in the list