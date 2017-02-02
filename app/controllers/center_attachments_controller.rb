class CenterAttachmentsController < ApplicationController
  before_action :set_center_attachment, only: [:show, :edit, :update, :destroy]

  # GET /center_attachments
  # GET /center_attachments.json
  def index
    @center_attachments = CenterAttachment.all
  end

  # GET /center_attachments/1
  # GET /center_attachments/1.json
  def show
  end

  # GET /center_attachments/new
  def new
    @center_attachment = CenterAttachment.new
  end

  # GET /center_attachments/1/edit
  def edit
  end

  # POST /center_attachments
  # POST /center_attachments.json
  def create
    @center_attachment = CenterAttachment.new(center_attachment_params)
    respond_to do |format|
      if @center_attachment.save
        format.html { redirect_to @center_attachment, notice: 'Center attachment was successfully created.' }
        format.json { render @center_attachment.as_json }
      else
        format.html { render :new }
        format.json { render json: @center_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /center_attachments/1
  # PATCH/PUT /center_attachments/1.json
  def update
    respond_to do |format|
      if @center_attachment.update(center_attachment_params)
        format.html { redirect_to @center_attachment, notice: 'Center attachment was successfully updated.' }
        format.json { render :show, status: :ok, location: @center_attachment }
      else
        format.html { render :edit }
        format.json { render json: @center_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /center_attachments/1
  # DELETE /center_attachments/1.json
  def destroy
    @center_attachment.destroy
    respond_to do |format|
      format.html { redirect_to center_attachments_url, notice: 'Center attachment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_center_attachment
      @center_attachment = CenterAttachment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def center_attachment_params
      params.require(:center_attachment).permit(:center_id, :cover)
    end
end
