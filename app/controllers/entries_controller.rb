require 'slack-notifier'

class EntriesController < ApplicationController

  def index
    @date = params[:date].try(:to_date) || Date.current

    @entry = Entry.new(date: @date)
    @entries = current_user.entries.where(date: @date)
  end

  def create
    @entry = current_user.entries.build(entry_params)

    if @entry.save
      redirect_to entries_path(date: @entry.date), notice: 'Entry was successfully created.'
    else
      @entries = current_user.entries.where(date: @entry.date)
      @week = week_data
      render :index
    end
  end

  def show
    @entry = current_user.entries.find(params[:id])
  end

  def destroy
    @entry = current_user.entries.find(params[:id])
    @entry.destroy
    respond_to do |format|
      format.html { redirect_to entries_path(date: @entry.date), notice: 'Entry was successfully destroyed.' }
    end
  end

  def send_message
    notifier = Slack::Notifier.new "https://hooks.slack.com/services/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"
    notifier.ping "Bitte ckal eintragen!"
    redirect_to entries_path
  end


  private

  def entry_params
    params.require(:entry).permit(:food, :calories, :date)
  end
end
