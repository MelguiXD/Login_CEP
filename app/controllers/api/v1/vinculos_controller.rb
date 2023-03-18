class Api::V1::VinculosController < ApplicationController
  before_action :set_vinculo, only: %i[ show update destroy ]

  # GET /vinculos
  def index
    @vinculos = Vinculo.all

    render json: @vinculos
  end

  # GET /vinculos/1
  def show
    render json: @vinculo
  end

  # POST /vinculos
  def create
    @vinculo = Vinculo.new(vinculo_params)

    if @vinculo.save
      render json: @vinculo, status: :created, location: @vinculo
    else
      render json: @vinculo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /vinculos/1
  def update
    if @vinculo.update(vinculo_params)
      render json: @vinculo
    else
      render json: @vinculo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /vinculos/1
  def destroy
    @vinculo.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vinculo

      #(user: User.order(:cep).last, address: Address.order(:cep).last
      #(user: User.maximum(:updated_at), address: Address.maximum(:updated_at))
      #(user: User.order("updated_at").last, address: Address.order("data").last)
      
      Vinculo.create(user: User.order("updated_at").last, address: Address.last) 
      @vinculo = Vinculo.all.select(:user_id, :address_id).distinct#(params[:id])

    end

    # Only allow a list of trusted parameters through.
    def vinculo_params
      params.require(:vinculo).permit(:user_id, :address_id)
    end
end
