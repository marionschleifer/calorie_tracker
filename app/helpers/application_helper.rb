module ApplicationHelper
  def calories_class(entry)
    if entry.calories < 0
      'green'
    else
      'pink'
    end
  end

  def bar_class(weekly_calories, ideal_calories)
    if weekly_calories < ideal_calories
      'progress-bar-success'
    else
      'progress-bar-danger'
    end
  end
end
