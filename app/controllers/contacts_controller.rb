class ContactsController < ApplicationController
  def index
    if Contact.all.empty?
      Contact.load_csv
    end
      @contacts = Contact.all
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.save
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :phone)
  end
end
