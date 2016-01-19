require 'slack-notifier'

class EntriesController < ApplicationController

  def index
    @date = date
    @entry = Entry.new(date: @date)
    @entries = current_user.entries.where(date: @date).ordered
  end

  def create
    @entry = current_user.entries.build(entry_params)
    respond_to do |format|
      if @entry.save
        #format.html { redirect_to entries_path(date: @entry.date) }
        format.json { render json: @entry, status: :created, location: @entry }
      else
        @entries = current_user.entries.where(date: @entry.date)
        @date = date
        #format.html { render :index }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @entry = current_user.entries.find(params[:id])
    @entry.destroy
    respond_to do |format|
      format.html { redirect_to entries_path(date: @entry.date) }
    end
  end

  def send_message
    notifier = Slack::Notifier.new(current_user.slack_url)
    notifier.ping "Bitte kcal eintragen!"
    redirect_to entries_path
  end

  def sort
    Entry.transaction do
      # entry_ids => [13, 12, 7, 17]
      params[:entry_ids].each_with_index do |entry_id, i|
        entry = current_user.entries.find(entry_id)
        entry.position = i + 1
        entry.save!
      end
    end
    head :ok
  end


  private

  def entry_params
    params.require(:entry).permit(:food, :calories, :date, :position)
  end

  def date
    params[:date].try(:to_date) || Date.current
  end
end
