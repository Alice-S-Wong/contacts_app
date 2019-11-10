class Api::ContactsController < ApplicationController

  def index
    @contacts = Contact.all
    render 'index.json.jb'
  end

  def show
    
  end

end
