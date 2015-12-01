class User::MissingEntriesReminderJob
  def self.run
    User.where.not(slack_url: nil).each do |user|
      new(user).send_reminder
    end
  end

  def initialize(user)
    @user = user
  end

  def send_reminder
    return false if entries_today?
    send_slack_reminder
    true
  end


  private

  def send_slack_reminder
    if Rails.env.production?
      Slack::Notifier.new(@user.slack_url).ping("Bitte kcal eintragen! #{href="http://awesomecalories.herokuapp.com/"}")
    else
      puts "[SLACK] Sending Reminder to #{@user.name}..."
      puts "Bitte kcal eintragen! #{href="http://awesomecalories.herokuapp.com/"}"
    end
  end

  def entries_today?
    @user.entries.where(date: Date.today).any?
  end
end