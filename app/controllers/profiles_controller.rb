class ProfilesController < ApplicationController

  def show
    @profile = Profile.find(params[:id])
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user

    if @profile.save
      flash[:notice] = "Profile was saved"
      redirect_to @profile
    else
      flash.now[:alert] = "There was an error saving profile"
      render :new
    end
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    @profile.assign_attributes(profile_params)

    if @profile.save
      flash[:notice] = "Profile was updated"
      redirect_to @profile

      flash.now[:alert] = "There was an error updating profile"
      render :new
    end
  end

  def destroy
    @profile = Profile.find(params[:id])

    if @profile.destroy
      flash[:notice] = "\"#{@profile.firstname} #{@profile.lastname}\"\'s\ profile has been deleted"
      redirect_to root_path
    else
      flash.now[:alert] = "There was an error deleting that profile"
    end
  end

end

private

def profile_params
  params.require(:profile).permit(:firstname, :lastname, :age)
end