class QuestsController < ApplicationController
  before_action :set_quest, only: %i[ show update destroy ]

  def index
    @quests = Quest.order(created_at: :desc)
    @quest = Quest.new
  end

  def show
  end

  def new
    @quest = Quest.new
  end

  def create
    @quest = Quest.new(quest_params)
    respond_to do |format|
      if @quest.save
        format.turbo_stream
        format.html { redirect_to quests_path, notice: "Quest was successfully created." }
        format.json { render :show, status: :created, location: @quest }
      else
        format.turbo_stream { render :new, status: :unprocessable_entity }
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @quest.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @quest.update(quest_params)
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to quests_path }
    end
  end

  def destroy
    @quest.destroy!
    @quests = Quest.order(created_at: :desc)

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to quests_path, notice: "Quest was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    def set_quest
      @quest = Quest.find(params[:id])
    end

    def quest_params
      params.require(:quest).permit(:name, :is_done)
    end
end
