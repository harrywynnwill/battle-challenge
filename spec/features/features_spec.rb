require 'spec_helper'

feature 'Enter names' do
  scenario 'submitting names' do
    sign_in_and_play
    expect(page).to have_content 'Harry vs. Mara'
  end
end

feature "Other player's hit points" do
  scenario 'see how close to winning' do
    sign_in_and_play
    expect(page).to have_content 'Mara: 60HP'
  end
end

feature 'Attacking' do
  scenario 'attack Mara' do
    sign_in_and_play
    click_button 'Attack'
    expect(page).to have_content 'Harry attacked Mara'
  end
  scenario 'reduce Maras HP by 10 points' do
    sign_in_and_play
    click_button 'Attack'
    expect(page).not_to have_content 'Mittens: 60HP'
    expect(page).to have_content 'Mittens: 50HP'
  end
end