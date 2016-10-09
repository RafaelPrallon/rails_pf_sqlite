class MedicaosController < ApplicationController
  before_action :set_medicao, only: [:show, :edit, :update, :destroy]

  require 'googlecharts'
  # GET /medicaos
  # GET /medicaos.json
  def index
    @medicaos = Medicao.all
  end
  
  def buscar(data_hora_inicio, data_hora_fim)
     i = 0
     array_medidas = []
     string_medidas ='0|'
     string_datas =''
     valor_atual = taxa_crescimento
   if Medicao.first.dataMedicao - Medicao.last.dataMedicao <= 86400 
     intervalo_minimo_tempo = 60
     formato = '%I:%R'
     
   elsif Medicao.first.dataMedicao - Medicao.last.dataMedicao <= (86400*30)
     intervalo_minimo_tempo = 86400
     formato = '%d/%m/%' 
   else 
     intervalo_minimo_tempo = 3600
     formato = '%d/%m/%Y %I:%R'
   end 
   horario_buffer = Medicao.first.dataMedicao - intervalo_minimo_tempo - 100 
   
   Medicao.all.each do |medicao| 
     medicao.dataMedicao 
     medicao.medida 
     array_medidas[i] = medicao.medida 
     if medicao.dataMedicao - horario_buffer <= intervalo_minimo_tempo 
       string_datas = string_datas << '|'
     else 
       string_datas = string_datas << medicao.dataMedicao.strftime(formato) << '|' 
       horario_buffer = medicao.dataMedicao.time
     end 
     string_medidas = string_medidas << valor_atual.to_s << '|'
     valor_atual += taxa_crescimento
     i+=1 
   end 
   
   string_datas = string_datas.chomp('|')
   string_medidas = string_medidas.chomp('|')
   
   render action 'buscar'
  
  end
  
  # GET /medicaos/1
  # GET /medicaos/1.json
  def show
  end

  # GET /medicaos/new
  def new
    @medicao = Medicao.new
  end

  # GET /medicaos/1/edit
  def edit
  end

  # POST /medicaos
  # POST /medicaos.json
  def create
    @medicao = Medicao.new(medicao_params)

    respond_to do |format|
      if @medicao.save
        format.html { redirect_to @medicao, notice: 'Medicao was successfully created.' }
        format.json { render :show, status: :created, location: @medicao }
      else
        format.html { render :new }
        format.json { render json: @medicao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /medicaos/1
  # PATCH/PUT /medicaos/1.json
  def update
    respond_to do |format|
      if @medicao.update(medicao_params)
        format.html { redirect_to @medicao, notice: 'Medicao was successfully updated.' }
        format.json { render :show, status: :ok, location: @medicao }
      else
        format.html { render :edit }
        format.json { render json: @medicao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medicaos/1
  # DELETE /medicaos/1.json
  def destroy
    @medicao.destroy
    respond_to do |format|
      format.html { redirect_to medicaos_url, notice: 'Medicao was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medicao
      @medicao = Medicao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def medicao_params
      params.require(:medicao).permit(:dataMedicao, :medida, :medidor)
    end
end