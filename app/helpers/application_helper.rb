module ApplicationHelper
  def calories_class(entry)
    if entry.calories < 0
      'green'
    else
      'pink'
    end
  end
end
