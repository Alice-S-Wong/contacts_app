class Api::ContactsController < ApplicationController

  def index
    @contacts = Contact.all
    render 'index.json.jb'
  end

  def show
    @contact = Contact.find_by(id: params[:id])
    render 'show.json.jb'
  end

  def create
    # coordinates = Geocoder.coordinates(params[:address])
    # if coordinates
    #   @contact = Contact.new(
    #     first_name: params[:first_name],
    #     middle_name: params[:middle_name],
    #     last_name: params[:last_name],
    #     email: params[:email],
    #     phone_number: params[:phone_number],
    #     bio: params[:bio],
    #     latitude: coordinates[0],
    #     longitude: coordinates[1]
    #     )
    # else
    #   @contact = Contact.new(
    #     first_name: params[:first_name],
    #     middle_name: params[:middle_name],
    #     last_name: params[:last_name],
    #     email: params[:email],
    #     phone_number: params[:phone_number],
    #     bio: params[:bio],
    #     )
    # end
    @contact = Contact.new(
      first_name: params[:first_name],
      middle_name: params[:middle_name],
      last_name: params[:last_name],
      email: params[:email],
      phone_number: params[:phone_number],
      bio: params[:bio],
      user_id: current_user.id
      )
    # if @contact.save
    #   render 'show.json.jb'
    # else  
    #   render json: {errors: @contact.errors.full_messages}, status: :unprocessable_entity
    # end
    @contact.save
    render 'show.json.jb'
  end

  def update
    # coordinates = Geocoder.coordinates(params[:address])
    @contact = Contact.find_by(id: params[:id])
    @contact.first_name = params[:first_name] || @contact.first_name
    @contact.middle_name = params[:middle_name] || @contact.middle_name
    @contact.last_name = params[:last_name] || @contact.last_name
    @contact.email = params[:email] || @contact.email
    @contact.phone_number = params[:phone_number] || @contact.phone_number
    @contact.bio = params[:bio] || @contact.bio
    # if coordinates 
    #   @contact.latitude = coordinates[0] || @contact.latitude
    #   @contact.longitude = coordinates[1] || @contact.longitude
    # end
    if @contact.save
      render 'show.json.jb' 
    else
      render json: {errors: @contact.errors.full_messages}, status: :unprocessable_entity
    end
 
  end
  
  def destroy
    @contact = Contact.find_by(id: params[:id])
    @contact.destroy
    render 'show.json.jb'  
  end

end
