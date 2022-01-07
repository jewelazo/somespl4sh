class CategoriesController < ApplicationController

    # GET /categories
    def index
        @categories=Category.all
    end

    # GET /categories/:id
    def show
        @category=Category.find_by(id: params[:id])
    end

    # GET /categories/new
    def new
        @category=Category.new
    end
    
end
