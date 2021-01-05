module SharedHelper
  def alert_type(type)
    case type
    when :error, "error"
      "is-danger"
    when :notice, "notice", :alert, "alert"
      "is-warning"
    when :success, "success"
      "is-success"
    when :info, "info"
      "is-info"
    else
      type.to_s
    end
  end

  def title
    base = "Process Reading Study"

    if @title.blank?
      base
    else
      "#{base} | #{@title}"
    end
  end
end
