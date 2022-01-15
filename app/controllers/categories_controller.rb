class CategoriesController < ApplicationController

    # GET /categories
    def index
        @categories=Category.all
    end

    # GET /categories/:id
    def show
        @category=Category.find_by(id: params[:id])
        @comments= @category.comments
        @comment_new=@comments.new
    end

    # GET /categories/new
    def new
        @category=Category.new 
   
    end

    # GET /categories/:id/edit
    def edit
        @category=Category.find_by(id: params[:id])
    end
    
    # POST /categories
    def create
        @category=Category.new(category_params)
        if @category.save
            redirect_to categories_path
        else
            render :new
        end
    end

    # PATCH /categories/:id
    def update
        @category=Category.find_by(id:params[:id])
        if @category.update(category_params)
            redirect_to categories_path
        else
            render :edit
        end
    end

    #DELETE /categories/:id
    def destroy
        @category=Category.find_by(id:params[:id])
        @category.destroy
        redirect_to root_path
    end


    private
    def category_params
        params.require(:category).permit(:name,:description,:cover)
    end
end
