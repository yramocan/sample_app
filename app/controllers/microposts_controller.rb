class MicropostsController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy, :favorite]
	before_action :correct_user,   only: :destroy

	def create
		@micropost = current_user.microposts.build(micropost_params)

		if @micropost.save
			redirect_to root_url
		else
			@feed_items = []
			render 'static_pages/home'
		end
	end

	def show
		@micropost = Micropost.find(params[:id])
		@user = @micropost.user
	end

	def destroy
		@micropost.destroy
		flash[:success] = "Micropost deleted"
		redirect_to request.referrer || root_url
	end

	# Add and remove favorite microposts
  # for current_user
  def favorite
    type = params[:type]
    if type == "favorite"
      current_user.favorites << @micropost
			flash[:success] = "You favorited #{@micropost.user.name}'s twit!"
      redirect_to :back

    elsif type == "unfavorite"
      current_user.favorites.delete(@micropost)
			flash[:warning] = "You unfavorited #{@micropost.user.name}'s twit."
      redirect_to :back

    else
      # Type missing, nothing happens
      redirect_to :back
    end
  end

	private
		def micropost_params
			params.require(:micropost).permit(:content, :picture)
		end

		def correct_user
			@micropost = current_user.microposts.find_by(id: params[:id])
			redirect_to root_url if @micropost.nil?
		end
end
