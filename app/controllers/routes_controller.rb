class RoutesController < ApplicationController
  
  def favorites
    @routes = current_user.routes

    render("routes/favorites.html.erb")
  end
  
  def index
    @routes = Route.all
    
    # parsed_map = JSON.parse(open(@route.parsed_maps_data).read)

    render("routes/index.html.erb")
  end

  def show
    @route = Route.find(params[:id])
    
    @bookmarks = Bookmark.all
    
    # parsed_map = JSON.parse(open(@route.parsed_maps_data).read)

    render("routes/show.html.erb")
  end

  def new
    @route = Route.new
    
    
    render("routes/new.html.erb")
  end

  def create
    @route = Route.new
    
    @route.user_id = current_user.id
    @route.name = params[:name]
    @route.origin = params[:origin]
    @route.destination = params[:destination]
    
    @origin_url = @route.origin.gsub(" ", "+")
    @destination_url = @route.destination.gsub(" ", "+")
    
    @route.map = "https://www.google.com/maps/dir/" + @origin_url + "/" + @destination_url
    
    @route.parsed_maps_data = "https://maps.googleapis.com/maps/api/directions/json?origin=" + @origin_url + "&destination=" + @destination_url
    
    # parsed_map = JSON.parse(open(@route.parsed_maps_data).read)
    
    # @route.steps = @route.parsed_map["routes"][0]["legs"][0]["steps"].count
    @route.steps = 5
    
    # @routes.steps.each do |step|
    
      # @waypoint = Waypoint.new
        
      # @waypoint.route_id = @route.id
      # @waypoint.latitude = parsed_maps_data["routes"][0]["legs"][0]["steps"][step]["end_location"]["lat"]
      # @waypoint.longitude = parsed_maps_data["routes"][0]["legs"][0]["steps"][step]["end_location"]["lng"]
      
    # end
    
    save_status = @route.save

    if save_status == true
      redirect_to("/routes/#{@route.id}", :notice => "Route created successfully.")
    else
      render("routes/new.html.erb")
    end
  end

  def edit
    @route = Route.find(params[:id])

    render("routes/edit.html.erb")
  end

  def update
    @route = Route.find(params[:id])

    @route.user_id = params[:user_id]
    @route.name = params[:name]
    @route.origin = params[:origin]
    @route.destination = params[:destination]
    
    save_status = @route.save

    if save_status == true
      redirect_to("/routes/#{@route.id}", :notice => "Route updated successfully.")
    else
      render("routes/edit.html.erb")
    end
  end

  def destroy
    @route = Route.find(params[:id])

    @route.destroy

    if URI(request.referer).path == "/routes/#{@route.id}"
      redirect_to("/", :notice => "Route deleted.")
    else
      redirect_to(:back, :notice => "Route deleted.")
    end
  end
end
