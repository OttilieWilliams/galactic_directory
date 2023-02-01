Given('I visit the Galactic Directory page') do
  visit(people_path)
end

When('I upload a file') do
  attach_file(:galactic_data_file, File.join(Rails.root, 'features', 'test_files', 'test_data.csv'))
  click_button 'Submit'
end

Then('I should see the list of valid people') do
  within '.person_0' do
    expect(page).to have_content('Darth')
    expect(page).to have_content('Vadar')
  end

  within '.person_1' do
    expect(page).to have_content('Chewbacca')
    expect(page).to have_content('Kashyyk')
  end
end
