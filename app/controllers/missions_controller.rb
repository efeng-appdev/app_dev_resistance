class MissionsController < ApplicationController
  def index
    @missions = Mission.page(params[:page]).per(10)

    render("missions/index.html.erb")
  end

  def show
    @mission_vote = MissionVote.new
    @mission_participant = MissionParticipant.new
    @mission = Mission.find(params[:id])

    render("missions/show.html.erb")
  end

  def new
    @mission = Mission.new

    render("missions/new.html.erb")
  end

  def create
    @mission = Mission.new

    @mission.total_passes = params[:total_passes]
    @mission.total_fails = params[:total_fails]
    @mission.outcome = params[:outcome]
    @mission.total_approve = params[:total_approve]
    @mission.total_disapprove = params[:total_disapprove]
    @mission.mission_approved = params[:mission_approved]

    save_status = @mission.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/missions/new", "/create_mission"
        redirect_to("/missions")
      else
        redirect_back(:fallback_location => "/", :notice => "Mission created successfully.")
      end
    else
      render("missions/new.html.erb")
    end
  end

  def edit
    @mission = Mission.find(params[:id])

    render("missions/edit.html.erb")
  end

  def update
    @mission = Mission.find(params[:id])

    @mission.total_passes = params[:total_passes]
    @mission.total_fails = params[:total_fails]
    @mission.outcome = params[:outcome]
    @mission.total_approve = params[:total_approve]
    @mission.total_disapprove = params[:total_disapprove]
    @mission.mission_approved = params[:mission_approved]

    save_status = @mission.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/missions/#{@mission.id}/edit", "/update_mission"
        redirect_to("/missions/#{@mission.id}", :notice => "Mission updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Mission updated successfully.")
      end
    else
      render("missions/edit.html.erb")
    end
  end

  def destroy
    @mission = Mission.find(params[:id])

    @mission.destroy

    if URI(request.referer).path == "/missions/#{@mission.id}"
      redirect_to("/", :notice => "Mission deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Mission deleted.")
    end
  end
end
