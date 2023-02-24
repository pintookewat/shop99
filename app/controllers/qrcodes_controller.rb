class QrcodesController < ApplicationController
  require 'RMagick'
  include Magick
  def index
    @qrcode = current_user.qrcodes
  end

  def show
    @qrcode = Qrcode.find(params[:id])
    return unless @qrcode.location.present?

    redirect_to @qrcode.location, allow_other_host: true
  end

  def new
    @qrcode = Qrcode.new
  end

  def edit
    @qrcode = Qrcode.find(params[:id])
  end

  def create
    @qrcode = current_user.qrcodes.create(qrcode_params)
    qr = if params[:qrcode][:location].present?
           RQRCode::QRCode.new(qrcode_url(@qrcode))
         else
           RQRCode::QRCode.new(qrcode_url(@qrcode))
         end
    png = qr.as_png(
      bit_depth: 1,
      border_modules: 4,
      color_mode: ChunkyPNG::COLOR_GRAYSCALE,
      color: params[:qrcode][:color],
      file: nil,
      fill: 'white',
      module_px_size: 6,
      resize_exactly_to: false,
      resize_gte_to: false,
      size: 300
    )
    filepath = "/uploads/qr_image/#{Time.now.to_i}.png"
    IO.binwrite('public' + filepath, png.to_s)


    img = Magick::ImageList.new('public' + filepath)

    text = Magick::Draw.new
    message = "#{params[:qrcode][:name]}"

    img.annotate(text, 0, 0, 0, 0, message) do
      text.gravity = Magick::SouthGravity # Text positioning
      text.pointsize = 30 # Font size
      text.fill = "#{params[:qrcode][:color]}" # Font color
      text.font = '/absolutepath/Font.ttf' # Font file; needs to be absolute
      img.format = 'png'
    end


    img.write('public' + filepath) # Destination ix`mage

    if @qrcode.update!(image: filepath)
      redirect_to '/qrcodes'

    else
      redirect_to new_qrcode_path
    end
  end

  def update
    @qrcode = Qrcode.find(params[:id])

    if @qrcode.update(qrcode_params)
      redirect_to '/qrcodes'
    else
      redirect_to edit_qrcode_path
    end
  end

  # DELETE /qrcodes/1 or /qrcodes/1.json
  def destroy_qr
    @qrcode = Qrcode.find(params[:qrcode_id])
    @qrcode.destroy
    redirect_to '/qrcodes'
  end

  private

  def set_qrcode
    @qrcode = Qrcode.find(params[:id])
  end

  def qrcode_params
    params.require(:qrcode).permit(:name, :location, :user_id, :file, :image, :color)
  end
end
