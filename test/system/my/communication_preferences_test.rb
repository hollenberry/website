require 'application_system_test_case'

class My::SettingsTest < ApplicationSystemTestCase
  setup do
    Git::ExercismRepo.stubs(current_head: "dummy-sha1")
    @user = create(:user,
                  accepted_terms_at: Date.new(2016, 12, 25),
                  accepted_privacy_policy_at: Date.new(2016, 12, 25))
    BootstrapUser.(@user)
    sign_in!(@user)
  end

  test "can navigate to communication preferences" do
    visit my_settings_path
    assert page.has_link?(href: edit_my_settings_communication_preferences_path)
    click_on "Preferences"
    assert_current_path edit_my_settings_communication_preferences_path
  end
end
