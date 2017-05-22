require 'rails_helper'

describe "User creates a new contact" do
  scenario "adds new contact in a company page" do
    company = create(:company, :with_jobs)

    visit company_jobs_path(company)
    fill_in "contact_full_name", with: "Sandy Smith"
    fill_in "contact_position", with: "CTO"
    fill_in "contact_email", with:"ssmith@woo.com"
    click_on "Create Contact"

    expect(current_path).to eq(company_jobs_path(company))
    expect(page).to have_content "Sandy Smith, CTO, ssmith@woo.com"
  end
end

