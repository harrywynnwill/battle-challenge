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
    expect(page).to have_content 'Mara: 100HP'
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
    expect(page).not_to have_content 'Mara: 100HP'
    expect(page).to have_content 'Mara: 90HP'
   end
    scenario 'reduce Harry HP by 10 points' do
    sign_in_and_play
    click_button 'Attack'
    click_button 'Attack'
    click_button 'Attack'

    expect(page).not_to have_content 'Harry: 100HP'
    expect(page).to have_content 'Harry: 90HP'
  end
    scenario 'player loses if score goes below zero' do
    sign_in_and_play
    38.times do click_button 'Attack' end
    expect(page).to have_content 'Loses'
  end
end