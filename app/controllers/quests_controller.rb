class QuestsController < ApplicationController
  # GET /quests or /quests.json
  def index
    @quests = Quest.order(created_at: :desc)
  end

  # GET /quests/1 or /quests/1.json
  def show
    @quest = Quest.find(params[:id])
  end

  # GET /quests/new
  def new
    @quest = Quest.new
  end

  # GET /quests/1/edit
  def edit
    @quest = Quest.find(params[:id])
  end

  # POST /quests or /quests.json
  def create
    @quest = Quest.create(quest_params)
    redirect_to quests_path
  end

  # PATCH/PUT /quests/1 or /quests/1.json
  def update
    @quest = Quest.find(params[:id])
    @quest.update(quest_params)
    redirect_to quests_path
  end

  # DELETE /quests/1 or /quests/1.json
  def destroy
    @quest = Quest.find(params[:id])
    @quest.destroy
    redirect_to quests_path
  end

  private

  def quest_params
    params.require(:quest).permit(:name)
  end
end
