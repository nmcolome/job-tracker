require 'rails_helper'

describe "User sees all jobs" do
  scenario "a user sees all the jobs for a specific company" do
    company = create(:company, :with_jobs)

    visit company_path(company)

    expect(page).to have_content(company.name)
    expect(page).to have_content(company.jobs.first.title)
    expect(page).to have_content(company.jobs.last.title)
  end
end
