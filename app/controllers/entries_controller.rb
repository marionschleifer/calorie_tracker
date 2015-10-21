class EntriesController < ApplicationController

  def index
    @week = week_data
    params[:date] ||= @week.first[:date]

    @entry = Entry.new(date: params[:date])
    @entries = current_user.entries.where(date: params[:date])
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

  private

  def entry_params
    params.require(:entry).permit(:food, :calories, :date)
  end

  def week_data
    [
      {
        name: "Montag",
        selected: (last_monday).to_s == params[:date],
        date: last_monday
      },
      {
        name: "Dienstag",
        selected: (last_monday + 1).to_s == params[:date],
        date: last_monday + 1
      },
      {
        name: "Mittwoch",
        selected: (last_monday + 2).to_s == params[:date],
        date: last_monday + 2
      },
      {
        name: "Donnerstag",
        selected: (last_monday + 3).to_s == params[:date],
        date: last_monday + 3
      },
      {
        name: "Freitag",
        selected: (last_monday + 4).to_s == params[:date],
        date: last_monday + 4
      },
      {
        name: "Samstag",
        selected: (last_monday + 5).to_s == params[:date],
        date: last_monday + 5
      },
      {
        name: "Sonntag",
        selected: (last_monday + 6).to_s == params[:date],
        date: last_monday + 6
      },
    ]
  end

  def last_monday
    Date.current.beginning_of_week
  end
end