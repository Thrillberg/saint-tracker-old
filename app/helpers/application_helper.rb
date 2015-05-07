module ApplicationHelper
  def display_date(d)
    #d = d.in_time_zone(current_user.time_zone) if logged_in? && !current_user.time_zone.blank?
    d.strftime("%m/%d/%Y")
  end
end