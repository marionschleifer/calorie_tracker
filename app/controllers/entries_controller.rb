class EntriesController < ApplicationController

  def active
    if (@monday+1).to_s == params[:date] ? 'active' : ''
      true
    else
      false
    end
  end

  def index
    @entry = Entry.new(date: params[:date])
    @monday = Date.current.beginning_of_week
    @week = [
      {
        name: "Monday",
        selected: active,
        date: @monday
      },
      {
        name: "Dienstag",
        selected: active,
        date: @monday + 1
      },
      {
        name: "Mittwoch",
        selected: active,
        date: @monday + 2
      },
      {
        name: "Donnerstag",
        selected: active,
        date: @monday + 3
      },
      {
        name: "Freitag",
        selected: active,
        date: @monday + 4
      },
      {
        name: "Samstag",
        selected: active,
        date: @monday + 5
      },
      {
        name: "Sonntag",
        selected: active,
        date: @monday + 6
      },
    ]
    @entries = current_user.entries.where(date: params[:date])
  end

  def create
    @entry = current_user.entries.build(entry_params)

    if @entry.save
      redirect_to entries_path(date: @entry.date), notice: 'Entry was successfully created.'
    else
      @monday = Date.current.beginning_of_week
      @entries = current_user.entries
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
      format.html { redirect_to entries_url, notice: 'Entry was successfully destroyed.' }
    end
  end

  private

  def entry_params
    params.require(:entry).permit(:food, :calories, :date)
  end
end