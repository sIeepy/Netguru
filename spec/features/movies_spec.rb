require "rails_helper"

describe "Movies requests", type: :feature do

  describe "movies list" do
    it "displays right title" do
      visit "/movies"
      expect(page).to have_selector("h1", text: "Movies")
    end
  end
end
