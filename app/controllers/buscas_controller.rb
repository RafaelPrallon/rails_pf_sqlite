class BuscasController < ApplicationController
  before_action :set_busca, only: [:show, :edit, :update, :destroy]

  require 'googlecharts'
  # GET /buscas
  # GET /buscas.json
  def index
    @buscas = Busca.all
  end
  def sobre
  end
  # GET /buscas/1
  # GET /buscas/1.json
  def show
  end

  # GET /buscas/new
  def new
    @busca = Busca.new
  end

  # GET /buscas/1/edit
  def edit
  end

  # POST /buscas
  # POST /buscas.json
  def create
    @busca = Busca.new(busca_params)

    respond_to do |format|
      if @busca.save
        format.html { redirect_to @busca, notice: 'Busca was successfully created.' }
        format.json { render :show, status: :created, location: @busca }
      else
        format.html { render :new }
        format.json { render json: @busca.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /buscas/1
  # PATCH/PUT /buscas/1.json
  def update
    respond_to do |format|
      if @busca.update(busca_params)
        format.html { redirect_to @busca, notice: 'Busca was successfully updated.' }
        format.json { render :show, status: :ok, location: @busca }
      else
        format.html { render :edit }
        format.json { render json: @busca.errors, status: :unprocessable_entity }
      end
    end
  end
  def iniciarbusca
    @buscas = Busca.all
  end
  # DELETE /buscas/1
  # DELETE /buscas/1.json
  def destroy
    @busca.destroy
    respond_to do |format|
      format.html { redirect_to buscas_url, notice: 'Busca was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_busca
      @busca = Busca.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def busca_params
      params.require(:busca).permit(:data_inicio, :data_fim, :data_hora_inicio, :data_hora_fim)
    end
end
