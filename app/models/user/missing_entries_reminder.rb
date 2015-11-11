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
    return if entries_today?
    send_slack_reminder
  end


  private

  def send_slack_reminder
    if Rails.env.production?
      Slack::Notifier.new(@user.slack_url).ping("Bitte kcal eintragen!")
    else
      puts "[SLACK] Sending Reminder to #{@user.name}..."
    end
  end

  def entries_today?
    return unless @user.entries[Date.today] != nil
  end
end
