module PagesHelper
  def logo_path
    if session[:participant_id]
      reading_path
    else
      root_path
    end
  end
end
