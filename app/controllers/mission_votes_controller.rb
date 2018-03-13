class MissionVotesController < ApplicationController
  def index
    @q = MissionVote.ransack(params[:q])
    @mission_votes = @q.result(:distinct => true).includes(:user, :mission).page(params[:page]).per(10)

    render("mission_votes/index.html.erb")
  end

  def show
    @mission_vote = MissionVote.find(params[:id])

    render("mission_votes/show.html.erb")
  end

  def new
    @mission_vote = MissionVote.new

    render("mission_votes/new.html.erb")
  end

  def create
    @mission_vote = MissionVote.new

    @mission_vote.vote = params[:vote]
    @mission_vote.user_id = params[:user_id]
    @mission_vote.mission_id = params[:mission_id]

    save_status = @mission_vote.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/mission_votes/new", "/create_mission_vote"
        redirect_to("/mission_votes")
      else
        redirect_back(:fallback_location => "/", :notice => "Mission vote created successfully.")
      end
    else
      render("mission_votes/new.html.erb")
    end
  end

  def edit
    @mission_vote = MissionVote.find(params[:id])

    render("mission_votes/edit.html.erb")
  end

  def update
    @mission_vote = MissionVote.find(params[:id])

    @mission_vote.vote = params[:vote]
    @mission_vote.user_id = params[:user_id]
    @mission_vote.mission_id = params[:mission_id]

    save_status = @mission_vote.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/mission_votes/#{@mission_vote.id}/edit", "/update_mission_vote"
        redirect_to("/mission_votes/#{@mission_vote.id}", :notice => "Mission vote updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Mission vote updated successfully.")
      end
    else
      render("mission_votes/edit.html.erb")
    end
  end

  def destroy
    @mission_vote = MissionVote.find(params[:id])

    @mission_vote.destroy

    if URI(request.referer).path == "/mission_votes/#{@mission_vote.id}"
      redirect_to("/", :notice => "Mission vote deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Mission vote deleted.")
    end
  end
end
