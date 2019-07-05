class ContactsController < ApplicationController
	def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
    	ContactMailer.contactus(@contact).deliver
      flash.now[:notice] = 'Thank you for your message. We will contact you soon!'
      # redirect_to root_path
    else
      flash.now[:error] = 'Cannot send message.'
      # redirect_to root_path
      render json: @contact.errors.full_messages.to_sentence, status: :unprocessable_entity
    end
  end

  private
    def contact_params
      params.require(:contact).permit(:name, :email, :message, :subject, :phone_number)
    end
end
