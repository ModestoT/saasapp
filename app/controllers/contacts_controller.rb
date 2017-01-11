class ContactsController < ApplicationController 
  def new
    @contact = Contact.new #creates a blank contact object
  end
  
  def create
    @contact = Contact.new(contact_params) #Fills in the blank parameters set in the contact object
    if @contact.save #saves the newly filled contact form to the database
    #save success
      flash[:success] = "Message Sent!"
      redirect_to new_contact_path 
    #save failed
    else
      flash[:danger] = @contact.errors.full_messages.join(", ")
      redirect_to new_contact_path
    end
  end
  
  #Gets the contact forms parameters 
  private
  def contact_params
    params.require(:contact).permit(:name, :email, :comments)
  end
end