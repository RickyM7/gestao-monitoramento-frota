class CaminhaosController < ApplicationController
  before_action :set_caminhao, only: %i[ show edit update destroy ]

  # GET /caminhaos or /caminhaos.json
  def index
    @caminhaos = Caminhao.all
  end

  # GET /caminhaos/1 or /caminhaos/1.json
  def show
  end

  # GET /caminhaos/new
  def new
    @caminhao = Caminhao.new
  end

  # GET /caminhaos/1/edit
  def edit
  end

  # POST /caminhaos or /caminhaos.json
  def create
    @caminhao = Caminhao.new(caminhao_params)

    respond_to do |format|
      if @caminhao.save
        format.html { redirect_to caminhao_url(@caminhao), notice: "Caminhao was successfully created." }
        format.json { render :show, status: :created, location: @caminhao }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @caminhao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /caminhaos/1 or /caminhaos/1.json
  def update
    respond_to do |format|
      if @caminhao.update(caminhao_params)
        format.html { redirect_to caminhao_url(@caminhao), notice: "Caminhao was successfully updated." }
        format.json { render :show, status: :ok, location: @caminhao }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @caminhao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /caminhaos/1 or /caminhaos/1.json
  def destroy
    @caminhao.destroy

    respond_to do |format|
      format.html { redirect_to caminhaos_url, notice: "Caminhao was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_caminhao
      @caminhao = Caminhao.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def caminhao_params
      params.require(:caminhao).permit(:modelo, :placa, :ano, :capacidade, :status, :chassi, :data_ultima_inspecao)
    end
end
