module V2
  class ContactsController < ApplicationController
    before_action :set_contact, only: [:show, :update, :destroy]

    # GET /contacts
    def index
      @contacts = Contact.last(5)
      render json: @contacts #methods: [:hello, :i18n] #root: true Mostra a classe de onde vem o objeto no json, methods é a lista de metodos q ele vai chamar
    end

    # GET /contacts/1
    def show
      render json: @contact, include: [:kind, :address, :phones]#, meta: { author: "Teste"} #, include: [:kind, :phones, :address]
    end

    # POST /contacts
    def create
      @contact = Contact.new(contact_params)

      if @contact.save
        render json: @contact, include: [:kind, :phones, :address], status: :created, location: @contact
      else
        render json: @contact.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /contacts/1
    def update
      if @contact.update(contact_params)
        render json: @contact, include: [:kind, :phones, :address]
      else
        render json: @contact.errors, status: :unprocessable_entity
      end
    end

    # DELETE /contacts/1
    def destroy
      @contact.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_contact
        @contact = Contact.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def contact_params
        #params.require(:contact).permit(
        #  :name, :email, :birthdate, :kind_id,
        #  phones_attributes: [ :id, :number, :_destroy],
        #  address_attributes: [:id, :street, :city]
        #) #parametros permitidos, precisa adicionar o Kind pra ele conseguir registrar o tipo
        ActiveModelSerializers::Deserialization.jsonapi_parse(params)
      end
  end
end
