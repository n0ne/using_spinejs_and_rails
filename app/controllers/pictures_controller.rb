class PicturesController < ApplicationController
  # GET /pictures
  # GET /pictures.json
  def index
    # @pictures = Picture.all
    @pictures = Picture.where("id > ?", params[:index] || 0).limit(8)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pictures }
    end
  end

  # GET /pictures/1
  # GET /pictures/1.json
  def show
    @picture = Picture.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @picture }
    end
  end

  # GET /pictures/new
  # GET /pictures/new.json
  def new
    @picture = Picture.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @picture }
    end
  end

  # GET /pictures/1/edit
  def edit
    @picture = Picture.find(params[:id])
  end

  # POST /pictures
  # POST /pictures.json
  def create
    # @picture = Picture.new(params[:picture])

    newparams = coerce(params)

    @picture = Picture.new(newparams[:picture])

    respond_to do |format|
      if @picture.save
        return  true
      else
        format.html { render action: "new" }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end

    # respond_to do |format|
    #   if @picture.save
    #     # format.html { redirect_to @picture, notice: 'Picture was successfully created.' }
    #     # format.json { render json: @picture, status: :created, location: @picture }
    #     return  true
    #   else
    #     format.html { render action: "new" }
    #     format.json { render json: @picture.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PUT /pictures/1
  # PUT /pictures/1.json
  def update
    @picture = Picture.find(params[:id])

    respond_to do |format|
      if @picture.update_attributes(params[:picture])
        format.html { redirect_to @picture, notice: 'Picture was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy

    respond_to do |format|
      format.html { redirect_to pictures_url }
      format.json { head :no_content }
    end
  end

  def get_thumb
    file = Picture.find_by_image(params[:file])
    respond_to do |format|
        format.json { render json: {:id => file.id, :thumb => file.image.thumb.url, :url => file.image.url} }
    end
  end

  private
  def coerce(params)
    if params[:picture].nil?
      h = Hash.new
      h[:picture] = Hash.new
      h[:picture][:image] = params[:Filedata]
      h
    else
      params
    end
  end
end
