class QuestsController < ApplicationController
  # GET /quests or /quests.json
  def index
    @quests = Quest.all
  end

  # GET /quests/1 or /quests/1.json
  def show
    @quest = Quest.find(params[:id])
  end
end
