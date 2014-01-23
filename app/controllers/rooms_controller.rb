class RoomsController < ApplicationController
	  


	  def index

	  	@rooms = Room.near("London")
	  	# room.near("london") , will only show those near london


	  end

	  

	  def show
	  		# find room in database
	  		@room = Room.find(params[:id])
	  


	  end

	  



	  def new

	  	@room = Room.new
	  

	  end


	
	  def create

		  	@room = Room.new(room_params)

		  	if @room.save

		  		flash[:success] = "You've added a room"

		  		redirect_to room_path(@room)



	  		else

	  			render "new"


	  		end

		
	  end  



	  def edit

	  	@room = Room.find(params[:id])
	  

	  end



	  def update

	  	@room = Room.find(params[:id])

	  	if @room.update(room_params)

	  		flash[:success] = "Your room has been updated"
	  		redirect_to room_path(@room)

	  	else

	  		render "edit"

	  	end


	  end




	  def destroy

	  	@room = Room.find(params[:id])

	  	@room.destroy

	  	flash[:success] = "your room has been deleted"

	  	redirect_to room_path


	  end


	  private 

	  #  stop edits.......

	  def room_params
	  	
	  	# shortcut for whitelisting form data

	  	params.require(:room).permit(:title, :address, :description, :max_guests, :bedrooms, :price)


	  end



end
