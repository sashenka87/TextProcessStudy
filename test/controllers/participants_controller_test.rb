require "test_helper"

class ParticipantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @participant = participants(:one)
  end

  test "should get index" do
    get participants_url, headers: sign_in_admin_header
    assert_response :success
  end

  test "should get new" do
    get new_participant_url
    assert_response :success
  end

  test "should create participant" do
    assert_difference('Participant.count') do
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

    assert_redirected_to directions_url
  end

  test "should show participant" do
    get participant_url(@participant), headers: sign_in_admin_header
    assert_response :success
  end

  test "should get edit" do
    get edit_participant_url(@participant), headers: sign_in_admin_header
    assert_response :success
  end

  test "should update participant" do
    patch participant_url(@participant), params: {
      participant: {
        class_code: @participant.class_code,
        email: @participant.email,
        first_name: @participant.first_name,
        last_name: @participant.last_name,
        passcode: @participant.passcode,
        section: @participant.section
      }
    }, headers: sign_in_admin_header
    assert_redirected_to participant_url(@participant)
  end

  test "should destroy participant" do
    assert_difference('Participant.count', -1) do
      delete participant_url(@participant), headers: sign_in_admin_header
    end

    assert_redirected_to participants_url
  end
end
