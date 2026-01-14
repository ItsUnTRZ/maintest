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

  # POST /quests or /quests.json
  def create
    @quest = Quest.create(quest_params)
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to quests_path }
    end
  end

  # PATCH/PUT /quests/1 or /quests/1.json
  def update
    @quest = Quest.find(params[:id])
    @quest.update(quest_params)
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to quests_path }
    end
  end

  # DELETE /quests/1 or /quests/1.json
  def destroy
    @quest = Quest.find(params[:id])
    @quest.destroy
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to quests_path }
    end
  end

  private

  def quest_params
    params.require(:quest).permit(:name, :is_done)
  end
end
