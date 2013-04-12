module ApplicationHelper
  def convert_date(datetime)
    datetime.in_time_zone("Pacific Time (US & Canada)").to_s.gsub(/-\d{4}/, "").strip + " PST"
  end
end
