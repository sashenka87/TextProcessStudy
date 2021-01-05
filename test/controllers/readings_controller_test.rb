require "test_helper"

class ReadingsControllerTest < ActionDispatch::IntegrationTest
  def sign_up_as_participant
    @participant = participants(:one)
    post participants_url, params: {
      participant: {
        class_code: @participant.class_code,
        email: @participant.email,
        first_name: @participant.first_name,
        last_name: @participant.last_name,
        passcode: @participant.passcode,
        section: @participant.section
      }
    }
  end

  test "should redirect back to the new participant form" do
    get reading_url
    assert_redirected_to new_participant_url
  end

  test "should get show" do
    sign_up_as_participant

    get reading_url
    assert_response :success
  end
end
