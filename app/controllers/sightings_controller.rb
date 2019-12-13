class SightingsController < ApplicationController


    def index 
        sightings = Sightings.all
        render json: sightings.to_json(include: [:bird, :location])]
    end
    
    
    
    
    
    def show
        sighting = Sighting.find_by(id: params[:id])
        if sighting
        render json: sighting.to_json(:include => {
            :bird => {:only => [:name, :species]},
            :location => {:only => [:latitude, :longitude]},
            } :except => [:updated_at])

        else
            render {message: 'No sighting found with that ID'}
        end
    end



end
