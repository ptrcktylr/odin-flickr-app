class PagesController < ApplicationController

  def index
    flickr = Flickr.new

    if params[:user_id]
      # get public photos from user
      begin
        photos_info = flickr.people.getPublicPhotos(api_key: ENV["FLICKR_API_KEY"], user_id: params[:user_id], format: "rest")
      rescue => exception
        redirect_to root_path, alert: "Couldn't find user with the specified ID"
      else
        @photo_links = photos_info.map {|photo_info| Flickr.url_b(photo_info)}
      end
    end
  end
end