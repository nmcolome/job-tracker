require 'rails_helper'

describe "Sorted comments" do
  scenario "user sees most recent comments first" do
    job = create(:job, :with_comments)
    last_comment = job.comments.create(content: "last one")
    company = job.company

    visit company_job_path(company, job)

    expect("last one").to appear_in_page_before(job.comments.first.content)
  end
end
