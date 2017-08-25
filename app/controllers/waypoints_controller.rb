class WaypointsController < ApplicationController
  def index
    @waypoints = Waypoint.all

    render("waypoints/index.html.erb")
  end

  def show
    @waypoint = Waypoint.find(params[:id])

    render("waypoints/show.html.erb")
  end

  def new
    @waypoint = Waypoint.new

    render("waypoints/new.html.erb")
  end

  def create
    @waypoint = Waypoint.new

    @waypoint.route_id = params[:route_id]
    
    # parsed_map = JSON.parse(open(@waypoint.route.parsed_maps_data).read)
    
    # @waypoint.latitude = parsed_map["routes"][0]["legs"][0]["steps"][0]["end_location"]["lat"]
    # @waypoint.longitude = parsed_map["routes"][0]["legs"][0]["steps"][0]["end_location"]["lng"]
    
    @waypoint.latitude = params[:latitude]
    @waypoint.longitude = params[:longitude]
    
    save_status = @waypoint.save

    if save_status == true
      redirect_to("/waypoints/#{@waypoint.id}", :notice => "Waypoint created successfully.")
    else
      render("waypoints/new.html.erb")
    end
  end

  def edit
    @waypoint = Waypoint.find(params[:id])

    render("waypoints/edit.html.erb")
  end

  def update
    @waypoint = Waypoint.find(params[:id])

    @waypoint.latitude = params[:latitude]
    @waypoint.longitude = params[:longitude]
    @waypoint.route_id = params[:route_id]

    save_status = @waypoint.save

    if save_status == true
      redirect_to("/waypoints/#{@waypoint.id}", :notice => "Waypoint updated successfully.")
    else
      render("waypoints/edit.html.erb")
    end
  end

  def destroy
    @waypoint = Waypoint.find(params[:id])

    @waypoint.destroy

    if URI(request.referer).path == "/waypoints/#{@waypoint.id}"
      redirect_to("/", :notice => "Waypoint deleted.")
    else
      redirect_to(:back, :notice => "Waypoint deleted.")
    end
  end
end
