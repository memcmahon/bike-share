require 'rails_helper'

describe "user sees all conditions" do
  context "navigates to conditions index" do
    it "shows all conditions" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      condition = create_list(:condition, 2)

      visit conditions_path

      expect(current_path).to eq(conditions_path)
      expect(page).to have_content(condition[0].month_day_converter)
      expect(page).to have_content(condition[1].month_day_converter)
    end
  end
end
