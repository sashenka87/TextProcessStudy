class PagesController < ApplicationController
  def about
    authenticate_admin
  end

  def bye
    redirect_to "https://pennstate.qualtrics.com/jfe/form/SV_0i9Cb0lOCCuEBoN"
    return
    # render layout: "blank"
  end

  def directions
  end

  def home
    render layout: "blank"
  end
end
