require 'rails_helper'

describe "User edits an existing job" do
  scenario "user sees updated job information" do
    company = create(:company, :with_jobs, job_count: 1)
    job = company.jobs.first

    visit "/companies/#{company.id}/jobs/#{job.id}"
    click_on "Edit"
    fill_in "job_level_of_interest", with: 95
    click_on "Update Job"

    expect(page).to have_content "Company: #{company.name}"
    expect(page).to have_content "Level of Interest: 95"
  end
end

#As a user
#when I visit the job page
#and I click on the Edit button
#and I fill in a new level of interes
#and I click on Save Changes
#it loads the specific job page and I can see my changes (lvl of interes)
