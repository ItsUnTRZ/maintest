require 'rails_helper'

RSpec.describe "Brag", type: :system do
  before do
    driven_by(:rack_test)
  end

  describe "brag page" do
    it "displays the brag document" do
      visit brag_path
      expect(page).to have_content("Brag Document")
    end

    it "shows goals section" do
      visit brag_path
      expect(page).to have_content("Goals")
    end

    it "shows achievements section" do
      visit brag_path
      expect(page).to have_content("Achievements")
    end

    it "shows skills section" do
      visit brag_path
      expect(page).to have_content("Skills")
    end

    it "has a link back to home" do
      visit brag_path
      expect(page).to have_link("Back to Home")
    end
  end
end
