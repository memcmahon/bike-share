require 'rails_helper'

describe 'as an admin' do
  describe 'when I navigate to the condition show page' do
    it 'shows delete and edit links' do
      admin = create(:admin)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      condition = create(:condition)

      visit admin_condition_path(condition)

      expect(page).to have_button("Delete")
      expect(page).to have_link("Edit")
    end
  end
end 
