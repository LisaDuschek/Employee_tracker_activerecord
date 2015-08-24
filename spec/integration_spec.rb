require('capybara/rspec')
require('./app')
require("spec_helper")

Capybara.app = Sinatra::Application
set(:show_exceptions, false)


describe('shows human catalog', {:type => :feature}) do
	it('shows home page') do
		visit('/')
		expect(page).to have_content('Human Categorizer')
	end
end
