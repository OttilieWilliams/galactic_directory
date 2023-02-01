Given('I visit the Galactic Directory page') do
  visit(people_path)
end

When('I upload a file') do
  attach_file(:galactic_data_file, File.join(Rails.root, 'features', 'test_files', 'test_data.csv'))
  click_button 'Submit'
end
