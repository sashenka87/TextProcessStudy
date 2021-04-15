class PagesController < ApplicationController
  def about
    authenticate_admin
  end

  def bye
    redirect_to "https://pennstate.qualtrics.com/jfe/form/SV_6sAw36pKFPeCTDE"
    return
    # render layout: "blank"
  end

  def directions
  end

  def home
    render layout: "blank"
  end
end
