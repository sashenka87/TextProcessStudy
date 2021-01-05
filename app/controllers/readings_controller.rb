class ReadingsController < ApplicationController
  before_action :check_participant

  NUM_READINGS = ENV.fetch('NUM_READINGS') { 1 }.to_i
  RANDOMIZED = ENV.fetch('RANDOMIZED_READINGS') { 'enabled' }
  HIGHLIGHTS = ENV.fetch('HIGHLIGHTS') { 'enabled' }

  def show
    reading_order = @participant.random_reading_order(NUM_READINGS, RANDOMIZED == 'enabled')
    current_text_ids = @participant.readings.pluck(:text_id)
    upcoming_texts = reading_order - current_text_ids

    @almost_done = upcoming_texts.length == 1
    @highlights_enabled = HIGHLIGHTS == 'enabled'

    @current_text = upcoming_texts.first
    @reading = Reading.new(text_id: @current_text, start_time: Time.now)

    if @current_text.nil?
      redirect_to bye_path
      return
    end
  end

  def create
    @reading = @participant.readings.build(reading_params)
    if @reading.save
      flash[:notice] = "Great. Now take a look at another text."
    else
      flash[:notice] = "It looks like you're trying to analyze a text that doesn't exist"
    end

    redirect_to action: :show
  end

  private

  def check_participant
    @participant = Participant.find_by_id(session[:participant_id])
    if @participant.nil?
      flash[:notice] = "You need to register before doing the readings"
      redirect_to new_participant_path
    end
  end

  # Only allow a list of trusted parameters through.
  def reading_params
    params.require(:reading).permit(:text_id, :comment, :start_time)
  end
end
