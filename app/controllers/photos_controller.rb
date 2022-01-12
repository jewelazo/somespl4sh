class PhotosController < ApplicationController

    # GET /categories/:category_id/photos
    def index
        category=Category.find_by(id:params[:category_id])
        @photos=category.photos
    end

    # GET /categories/:category_id/photos/:id
    def show
        @photo=Photo.find_by(id: params[:id])
    end

    # GET /categories/:category_id/photos/new
    def new
        # category=Category.find_by(id:params[:category_id])
        @photo=Photo.new
        @photo.category_id=params[:category_id]
    end

    # GET /categories/:category_id/photos/:id/edit
    def edit
        @photo=Photo.find_by(id: params[:id])
        @photo.category_id=params[:category_id]
    end
    
    # POST /categories/:category_id/photos
    def create
        # category=Category.find_by(id: params[:category_id])
        @photo=Photo.new(photo_params)
        # @photo.category_id=params[:category_id]
        if @photo.save
            # redirect_to "/categories/#{params[:category_id]}"
            redirect_to category_path(@photo.category)
        else
            render :new
        end
    end

    # PATCH /categories/:category_id/photos/:id
    def update
        @photo=Photo.find_by(id:params[:id])
        if @photo.update(photo_params)
             # redirect_to "/categories/#{params[:category_id]}"
             redirect_to category_path(@photo.category)
        else
            render :edit
        end
    end

    # DELETE /categories/:category_id/photos/:id
    def destroy
        @photo=Photo.find_by(id: params[:id])
        @photo.destroy
        # redirect_to "/categories/#{params[:category_id]}"
        redirect_to category_path(@photo.category)
        
    end


    private
    def photo_params
        params.require(:photo).permit(:title,:description,:category_id)
    end
end
