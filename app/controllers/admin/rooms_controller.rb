module Admin
  class RoomsController < ApplicationController
    def index
      @rooms = Room.all
    end
  end
end
