class ExperienceDecorator < Draper::Decorator
  delegate_all

  def time
    start_date = prettify_date(self.start_date)

    if self.end_date
      end_date = prettify_date(self.end_date)
    else
      end_date = "now"
    end

    "#{start_date} - #{end_date} (#{duration})"
  end

  def duration
    num_months = self.duration_in_months

    if num_months == 0
      "less than a month"
    elsif num_months == 1
      "1 month"
    elsif num_months < 12
      "#{num_months} months"
    else
      years = num_months / 12
      months = num_months % 12

      duration = "#{years} years"
      duration += " #{months} months" unless months.zero?
      duration
    end
  end

  private
  def prettify_date(date)
    "#{date.strftime("%B")} #{date.year}"
  end
end
