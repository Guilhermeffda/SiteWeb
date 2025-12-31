require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :headless_chrome, screen_size: [ 1400, 1400 ]

  # Ensure system tests are authenticated, since ApplicationController
  # requires login for all actions.
  def setup
    super
    visit login_url
    fill_in "Name", with: users(:one).name
    fill_in "Password", with: "secret"
    click_on "Login"
  end
end
