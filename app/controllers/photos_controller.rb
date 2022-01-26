class PhotosController < ApplicationController

    # GET /categories/:category_id/photos
    def index
        category=Category.find_by(id:params[:category_id])
        @photos=category.photos
    end

    # GET /categories/:category_id/photos/:id
    def show
        @photo=Photo.find_by(id: params[:id])
        @comment_new= @photo.comments.new()
        @comments=@photo.comments
    end

    # GET /categories/:category_id/photos/new
    def new
        # category=Category.find_by(id:params[:category_id])
        @photo=Photo.new()
        @photo.category_id=params[:category_id]
    end

    # GET /categories/:category_id/photos/:id/edit
    def edit
        @photo=Photo.find_by(id: params[:id])
       
    end
    
    # POST /categories/:category_id/photos
    def create
        # category=Category.find_by(id: params[:category_id])
        @photo=Photo.new(photo_params)
        # @photo.category_id=params[:category_id]
        respond_to do |format|
            if @photo.save
                format.html { redirect_to category_path(@photo.category), notice: "Photo was successfully created." }
            else
                format.html { render :new, status: :unprocessable_entity }
            end
        end
    end

    # PATCH /categories/:category_id/photos/:id
    def update
        @photo=Photo.find_by(id:params[:id])
        respond_to do |format|
            if @photo.update(photo_params)
                format.html { redirect_to category_path(@photo.category), notice: "Photo was successfully created." }
                 p @photo
                 p "----------------------------------------------------"
            else
                format.html { render :edit, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /categories/:category_id/photos/:id
    def destroy
        @photo=Photo.find_by(id: params[:id])
        @photo.destroy
        # redirect_to "/categories/#{params[:category_id]}"
        redirect_to category_path(@photo.category)
        
    end

    def search_form
        
    end

    def search
        @photos=Photo.where("lower(title) LIKE ?","%" + params[:q].downcase + "%")
    end
    private
    def photo_params
        params.require(:photo).permit(:title,:description,:category_id,:image)
    end
end
