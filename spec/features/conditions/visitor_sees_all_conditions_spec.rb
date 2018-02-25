require 'rails_helper'

describe "visitor sees all conditions" do
  context "navigate to conditions index" do
    it "shows all conditions" do
      visitor = create(:user)
      condition = create_list(:condition, 2)

      visit conditions_path

      expect(current_path).to eq(conditions_path)
      expect(page).to have_content(condition[0].month_day_converter)
      expect(page).to have_content(condition[1].month_day_converter)
    end
  end
end
