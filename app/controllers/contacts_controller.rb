class ContactsController < ApplicationController 
  def new
    @contact = Contact.new #creates a blank contact object
  end
  
  def create
    @contact = Contact.new(contact_params) #Fills in the blank parameters set in the contact object
    if @contact.save #saves the newly filled contact form to the database and an email
      name = params[:contact][:name]
      email = params[:contact][:email]
      body = params[:contact][:comments]
      ContactMailer.contact_email(name, email, body).deliver
      flash[:success] = "Message Sent!" #save success
      redirect_to new_contact_path 
    else
      flash[:danger] = @contact.errors.full_messages.join(", ")#save failed
      redirect_to new_contact_path
    end
  end
  
  #Gets the contact forms parameters 
  private
  def contact_params
    params.require(:contact).permit(:name, :email, :comments)
  end
end