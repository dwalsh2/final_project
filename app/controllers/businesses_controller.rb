class BusinessesController < ApplicationController
  def index
    @businesses = Business.all

    render("businesses/index.html.erb")
  end

  def show
    @business = Business.find(params[:id])

    render("businesses/show.html.erb")
  end

  def new
    @business = Business.new
    
    render("businesses/new.html.erb")
  end

  def create
    @business = Business.new

    @yelp = "https://www.yelp.com/search?find_desc=" + @business.bookmark.search_topic + "&find_loc=" + @business.waypoint.latitude + ", " + @business.waypoint.longitude + "&start=0&sortby=rating"
    
    @parsed_yelp_data = JSON.parse(open(@yelp).read)
    
    @business.waypoint_id = params[:waypoint_id]
    @business.name = @parsed_yelp_data["businesses"]["name"]]
    @business.image_url = @parsed_yelp_data["businesses"]["image_url"]]
    @business.url = @parsed_yelp_data["businesses"]["url"]]
    @business.phone = @parsed_yelp_data["businesses"]["phone"]]
    @business.rating = @parsed_yelp_data["businesses"]["rating"]]
    @business.location = @parsed_yelp_data["businesses"]["location"]["city"]]
    @business.yelp_api_return = @parsed_yelp_data
    
    save_status = @business.save

    if save_status == true
      redirect_to("/businesses/#{@business.id}", :notice => "Business created successfully.")
    else
      render("businesses/new.html.erb")
    end
  end

  def edit
    @business = Business.find(params[:id])

    render("businesses/edit.html.erb")
  end

  def update
    @business = Business.find(params[:id])

    @business.waypoint_id = params[:waypoint_id]
    @business.name = params[:name]
    @business.image_url = params[:image_url]
    @business.url = params[:url]
    @business.phone = params[:phone]
    @business.rating = params[:rating]
    @business.location = params[:location]
    @business.yelp_api_return = params[:yelp_api_return]

    save_status = @business.save

    if save_status == true
      redirect_to("/businesses/#{@business.id}", :notice => "Business updated successfully.")
    else
      render("businesses/edit.html.erb")
    end
  end

  def destroy
    @business = Business.find(params[:id])

    @business.destroy

    if URI(request.referer).path == "/businesses/#{@business.id}"
      redirect_to("/", :notice => "Business deleted.")
    else
      redirect_to(:back, :notice => "Business deleted.")
    end
  end
end
