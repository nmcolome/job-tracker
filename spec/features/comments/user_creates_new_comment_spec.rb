require 'rails_helper'

describe "User creates a new comment" do
  scenario "adds new comment in a job page" do
    company = create(:company, :with_jobs)
    job = company.jobs.first

    visit company_job_path(company, job)
    fill_in "comment_content", with: "Call back"
    click_on "Submit Comment"

    expect(current_path).to eq(company_job_path(company, job))
    expect(page).to have_content "Call back"
  end
end

