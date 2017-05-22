require 'rails_helper'

describe "User sees one company" do
  scenario "a user sees a company" do
    company = create(:company, :with_jobs)

    visit company_path(company)

    expect(current_path).to eq("/companies/#{company.id}/jobs")
    expect(page).to have_content(company.name)
    expect(page).to have_content("Developer")
  end

  scenario "a user sees a form to enter a contact" do
    company = create(:company)

    visit company_path(company)

    expect(page).to have_content "Add a contact"
    expect(page).to have_content "Full name"
    expect(page).to have_content "Position"
    expect(page).to have_content "Email"
    expect(page).to have_button "Create Contact"
  end
end
