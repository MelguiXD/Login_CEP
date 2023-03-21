class Api::V1::AddressesController < ApplicationController
  before_action :set_address, only: %i[ show update destroy ]

  # GET /addresses
  def index
    @addresses = Address.where(erro: [nil, false]).order(id: 'DESC').limit(1)

    render json: @addresses
  end

  # GET /addresses/1
  def show
    render json: @address
  end

  # POST /addresses
  def create
    @address = Address.new(address_params)

    if @address.save
      render json: @address, status: :created, location: @address
    else
      render json: @address.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /addresses/1
  def update
    if @address.update(address_params)
      render json: @address
    else
      render json: @address.errors, status: :unprocessable_entity
    end
  end

  # DELETE /addresses/1
  def destroy
    @address.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
      zip_code = Address.format_cep(params[:cep])
      @address = Address.find_by_cep(zip_code)

      @address ||= Address.get_from_remote(zip_code, "https://ws.apicep.com/cep/#{zip_code}.json", 'apicep')
      @address ||= Address.get_from_remote(zip_code, "https://viacep.com.br/ws/#{zip_code}/json/unicode", 'viacep')
      @address ||= Address.get_from_remote(zip_code, "https://brasilapi.com.br/api/cep/v1/#{zip_code}/", 'brasilapi')
      @address ||= Address.get_from_remote(zip_code, "http://cep.la/#{zip_code}/", 'cepla')
      @address ||= Address.new(erro: true)      

      @address = Address.find_by_cep(zip_code).touch
    end

    # Only allow a list of trusted parameters through.
    def address_params
      params.require(:address).permit(:cep, :logradouro, :complemento, :bairro, :cidade, :uf, :ibge, :gia, :ddd, :siafi, :erro)
    end
end
