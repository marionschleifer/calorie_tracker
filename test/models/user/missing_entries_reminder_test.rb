require 'test_helper'

class MissingEntriesReminderJobTest < ActiveSupport::TestCase
  setup do
    @marion = users(:marion)
    @tobias = users(:tobias)
  end

  test 'send reminder' do
    reminder = User::MissingEntriesReminderJob.new(@tobias)
    assert reminder.send_reminder
  end

  test 'send no reminder' do
    reminder = User::MissingEntriesReminderJob.new(@marion)
    assert_not reminder.send_reminder
  end
end
