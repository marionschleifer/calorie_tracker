class EntriesController < ApplicationController

  def index
    @entries = Entry.all
    @entry = Entry.new
  end

  def new
  end

  def create
    @entry = Entry.new(entry_params)

    if @entry.save
      redirect_to entries_path, notice: 'Entry was successfully created.'
    else
      @entries = Entry.all
      render :index
    end
  end

  def show
    @entry = Entry.find(params[:id])
  end

  def destroy
    @entry = Entry.find(params[:id])
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