class ArtistsController < ApplicationController
    def index
        @artists = Artist.all
    end

    def show
        @artist = Artist.find(params[:id])
    end

    def new
        @artist = Artist.new
    end

    def create
        Artist.transaction do
            @artist = Artist.create!(artist_params)
        end
        
        if @artist.save
            redirect_to artist_path(@artist)
        else
           render :new
        end
    end

    def destroy
        @artist = Artist.find(params[:id])
        Artist.transaction do
            if @artist.destroy!
                redirect_to artists_path
            else
                render :show
            end
        end
    end
    
    private 
        def artist_params
            params.require(:artist).permit(:name, :artist_group)
        end
end
