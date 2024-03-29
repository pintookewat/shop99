class QrcodesController < ApplicationController
  require 'RMagick'
  require 'chunky_png'
  include Magick

  def index
    if params[:query].present?
     @qrcode = current_user.qrcodes.search_by_name(params[:query])
    else
      @qrcode = current_user.qrcodes
    end
  end

  def show
    @qrcode = Qrcode.friendly.find(params[:id])
    if  @qrcode.location.present?
      redirect_to @qrcode.location, allow_other_host: true
    end
  end

  def new
    @qrcode = Qrcode.new
  end

  def edit
    @qrcode = Qrcode.friendly.find(params[:id])
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
    #  module_px_size: 6,
      module_px_size: 6/4,
      resize_exactly_to: false,
      resize_gte_to: false,
      size: 300,
    )
    # byebug
    #   mask = ChunkyPNG::Image.new(300, 300, ChunkyPNG::Color::BLACK)

    #   # Draw a circle in the center of the mask
    #   center_x = 300 / 2
    #   center_y = 300 / 2
    #   radius = 300 / 2 - 5
    #   mask.circle(center_x, center_y, radius, ChunkyPNG::Color::WHITE, ChunkyPNG::Color::BLACK)
    #   png = ChunkyPNG::Image.from_blob(png).to_s
    #   png.compose!(mask)

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


  def recover_qrcode_page
      @deleted_qrcode = Qrcode.with_deleted.friendly.where.not(deleted_at: nil)
  end

  def recover_qrcode
    qrcode = Qrcode.only_deleted.friendly.find(params[:qrcode_id])
    if qrcode.recover
      redirect_to '/qrcodes'
    else
      redirect_to qrcode_recover_qrcode_path 
    end
  end



  def checkbox_list_qrcodes

  end



 def all_recover_qrcode
    @qrcode = Qrcode.with_deleted.friendly.where.not(deleted_at: nil)

    @qrcode.each do |qrcode|
      qrcode.recover
    end
    if  @qrcode.blank?
      redirect_to '/qrcodes'
    else
      redirect_to all_recover_qrcode_qrcodes_path 
    end
 end

 def  all_delete_qrcode
    qrcode = Qrcode.only_deleted.all
    if qrcode.destroy_all
      redirect_to '/qrcodes'
    else
      redirect_to all_delete_qrcode_qrcodes_path
    end
 end
  def update
    @qrcode = Qrcode.friendly.find(params[:id])
    if @qrcode.update(qrcode_params)
      redirect_to '/qrcodes'
    else
      redirect_to edit_qrcode_path
    end
  end

  # DELETE /qrcodes/1 or /qrcodes/1.json
  def destroy_qr
    @qrcode = Qrcode.friendly.find(params[:qrcode_id])
    @qrcode.destroy
    redirect_to '/qrcodes'
  end

  private

  def set_qrcode
    @qrcode = Qrcode.friendly.find(params[:id])
  end

  def qrcode_params
    params.require(:qrcode).permit(:name, :location, :user_id, :file, :image, :color, :shape)
  end
end
