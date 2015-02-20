module ExperienceHelper
  def exp_date_select(attribute, selected)
    date_select(
      "experience",
      attribute, {
        start_year: Date.current.year,
        end_year: 1990,
        add_month_numbers: true,
        discard_day: true,
        prompt: true,
        selected: selected
      }, {
        class: "text-border"
      }
    )
  end
end