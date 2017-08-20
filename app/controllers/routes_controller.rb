class RoutesController < ApplicationController
  def index
    @routes = Route.all

    render("routes/index.html.erb")
  end

  def show
    @route = Route.find(params[:id])

    render("routes/show.html.erb")
  end

  def new
    @route = Route.new
    
    
    render("routes/new.html.erb")
  end

  def create
    @route = Route.new
    
    @route.user_id = params[:user_id]
    @route.name = params[:name]
    @route.origin = params[:origin]
    @route.destination = params[:destination]
    
    @origin_url = @route.origin.gsub(" ", "+")
    @destination_url = @route.destination.gsub(" ", "+")
    
    @route.map = "https://maps.googleapis.com/maps/api/directions/json?origin=" + @origin_url + "&destination=" + @destination_url
    
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
