class QuestsController < ApplicationController
  # GET /quests or /quests.json
  def index
    @quests = Quest.all
  end

  # GET /quests/1 or /quests/1.json
  def show
    @quest = Quest.find(params[:id])
  end

  # GET /quests/new
  def new
    @quest = Quest.new
  end

  # POST /quests or /quests.json
  def create
    @quest = Quest.create(quest_params)
    redirect_to quests_path
  end

  private

  def quest_params
    params.require(:quest).permit(:name)
  end
end
