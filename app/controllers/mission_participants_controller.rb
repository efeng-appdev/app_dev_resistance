class MissionParticipantsController < ApplicationController
  def index
    @q = MissionParticipant.ransack(params[:q])
    @mission_participants = @q.result(:distinct => true).includes(:user, :mission).page(params[:page]).per(10)

    render("mission_participants/index.html.erb")
  end

  def show
    @mission_participant = MissionParticipant.find(params[:id])

    render("mission_participants/show.html.erb")
  end

  def new
    @mission_participant = MissionParticipant.new

    render("mission_participants/new.html.erb")
  end

  def create
    @mission_participant = MissionParticipant.new

    @mission_participant.user_id = params[:user_id]
    @mission_participant.mission_id = params[:mission_id]
    @mission_participant.pass_or_fail = params[:pass_or_fail]

    save_status = @mission_participant.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/mission_participants/new", "/create_mission_participant"
        redirect_to("/mission_participants")
      else
        redirect_back(:fallback_location => "/", :notice => "Mission participant created successfully.")
      end
    else
      render("mission_participants/new.html.erb")
    end
  end

  def edit
    @mission_participant = MissionParticipant.find(params[:id])

    render("mission_participants/edit.html.erb")
  end

  def update
    @mission_participant = MissionParticipant.find(params[:id])

    @mission_participant.user_id = params[:user_id]
    @mission_participant.mission_id = params[:mission_id]
    @mission_participant.pass_or_fail = params[:pass_or_fail]

    save_status = @mission_participant.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/mission_participants/#{@mission_participant.id}/edit", "/update_mission_participant"
        redirect_to("/mission_participants/#{@mission_participant.id}", :notice => "Mission participant updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Mission participant updated successfully.")
      end
    else
      render("mission_participants/edit.html.erb")
    end
  end

  def destroy
    @mission_participant = MissionParticipant.find(params[:id])

    @mission_participant.destroy

    if URI(request.referer).path == "/mission_participants/#{@mission_participant.id}"
      redirect_to("/", :notice => "Mission participant deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Mission participant deleted.")
    end
  end
end
