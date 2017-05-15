class DetalleCarritosController < ApplicationController
  before_action :set_detalle_carrito, only: [:show, :edit, :update, :destroy]

  # GET /detalle_carritos
  # GET /detalle_carritos.json
  def index
    @detalle_carritos = DetalleCarrito.all
  end

  # GET /detalle_carritos/1
  # GET /detalle_carritos/1.json
  def show
  end

  # GET /detalle_carritos/new
  def new
    @detalle_carrito = DetalleCarrito.new
  end

  # GET /detalle_carritos/1/edit
  def edit
  end

  # POST /detalle_carritos
  # POST /detalle_carritos.json
  def create
    @detalle_carrito = DetalleCarrito.new(detalle_carrito_params)

    respond_to do |format|
      if @detalle_carrito.save
        format.html { redirect_to @detalle_carrito, notice: 'Detalle carrito was successfully created.' }
        format.json { render :show, status: :created, location: @detalle_carrito }
      else
        format.html { render :new }
        format.json { render json: @detalle_carrito.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /detalle_carritos/1
  # PATCH/PUT /detalle_carritos/1.json
  def update
    respond_to do |format|
      if @detalle_carrito.update(detalle_carrito_params)
        format.html { redirect_to @detalle_carrito, notice: 'Detalle carrito was successfully updated.' }
        format.json { render :show, status: :ok, location: @detalle_carrito }
      else
        format.html { render :edit }
        format.json { render json: @detalle_carrito.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /detalle_carritos/1
  # DELETE /detalle_carritos/1.json
  def destroy
    @detalle_carrito.destroy
    respond_to do |format|
      format.html { redirect_to detalle_carritos_url, notice: 'Detalle carrito was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_detalle_carrito
      @detalle_carrito = DetalleCarrito.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def detalle_carrito_params
      params.require(:detalle_carrito).permit(:id_producto, :carrito_id, :status)
    end
end
