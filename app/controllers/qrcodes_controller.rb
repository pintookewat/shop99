  class QrcodesController < ApplicationController
   
    def index
      @qrcodes = Qrcode.all
    end


    # def show
    # end

    def new
      @qrcode = Qrcode.new
    end


    def edit
    end


    def create
      qrcode = current_user.qrcodes.create(qrcode_params)

      qr = RQRCode::QRCode.new(qrcode_url(qrcode))
      png = qr.as_png(
        bit_depth: 1,
        border_modules: 4,
        color_mode: ChunkyPNG::COLOR_GRAYSCALE,
        color: params[:qrcode][:color],
        file: nil,
        fill: "white",
        module_px_size: 6,
        resize_exactly_to: false,
        resize_gte_to: false,
        size: 300
      )
      filepath = "/uploads/qr_image/#{Time.now.to_i}.png"
      IO.binwrite('public' + filepath, png.to_s)


      
        if qrcode.update(image: filepath)
          redirect_to  user_user_index_path
          
        else
          redirect_to new_qrcode_path
      end

    end


    def update
       @qrcode = Qrcode.find(params[:id])
      respond_to do |format|
        if @qrcode.update(qrcode_params)
          format.html { redirect_to qrcode_url(@qrcode), notice: "Qrcode was successfully updated." }
          format.json { render :show, status: :ok, location: @qrcode }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @qrcode.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /qrcodes/1 or /qrcodes/1.json
    def destroy
      binding.break
      @qrcode = Qrcode.find(params[:id])
      @qrcode.destroy

      # respond_to do |format|
      #   format.html { redirect_to qrcodes_url, notice: "Qrcode was successfully destroyed." }
      #   format.json { head :no_content }
      # end
    end

    private

      def set_qrcode
        @qrcode = Qrcode.find(params[:id])
      end

      def qrcode_params
        params.require(:qrcode).permit(:name,  :location, :user_id)
      end
  end
