class ContactsController < ApplicationController
  def index
    if Contact.all.empty?
      Contact.load_csv
    end
    sql_query = "name ILIKE :name OR email ILIKE :email"

    @contacts = Contact.where(sql_query, name: params[:name], email: params[:email])

    if params[:query].present?
      sql_query = "name ILIKE :query OR email ILIKE :query OR cast(phone as text) ILIKE :query"

      @contacts = Contact.where(sql_query, query: params[:query])
    elsif !params[:query].present? && !params[:name].present? && !params[:email].present?
      @contacts = Contact.all
    end

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
