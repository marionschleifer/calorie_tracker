module ApplicationHelper
  def calories_class(entry)
    if entry.calories < 0
      'text-success'
    else
      'text-danger'
    end
  end
end
