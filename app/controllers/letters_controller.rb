class LettersController < ApplicationController
  before_action :set_letter, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @letters = Letter.all
    @babies = Baby.all
    respond_with(@letters)
  end

  def show
    respond_with(@letter)
  end

  def new
    @letter = Letter.new
    redirect_to timeline_baby_path(@letter.baby_id)
  end

  def edit
    @letter
  end

  def create
    @letter = Letter.new(letter_params)
    if @letter.posted_on == nil
      @letter.posted_on = Date.current
    end
    @letter.save
    redirect_to timeline_baby_path(@letter.baby_id)
  end

  def update
    @letter.update(letter_params)
    redirect_to timeline_baby_path(@letter.baby_id)
  end

  def destroy
    @letter.destroy
    redirect_to timeline_baby_path(@letter.baby_id)
  end

  private
    def set_letter
      @letter = Letter.find(params[:id])
    end

    def letter_params
      params.require(:letter).permit(:title, :content, :posted_on, :baby_id)
    end
end
