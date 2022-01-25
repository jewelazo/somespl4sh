class CommentsController < ApplicationController
    # POST /categories/:category_id/comments
    # POST /photos/:photo_id/comments
    def create
        if params[:category_id]
            @commentable=Category.find_by(id: params[:category_id])
            @category=@commentable
            @comments=@category.comments
        elsif params[:photo_id]
            @commentable=Photo.find_by(id: params[:photo_id])
            @photo=@commentable
            @comments=@photo.comments
        end
        @comment_new=@commentable.comments.new(comment_params)
        respond_to do |format|
            if @comment_new.save
                # redirect_to @commentable
                format.html { redirect_to @commentable, notice: "Comment was successfully created." }
            else
                format.html { render 'photos/show', status: :unprocessable_entity }
            end
        end
    end

    # DELETE /categories/:category_id/comments/:id
    # DELETE /photos/:photo_id/comments/:id
    def destroy
        @commentable=Category.find_by(id: params[:category_id]) if params[:category_id]
        @commentable=Photo.find_by(id: params[:photo_id]) if params[:photo_id]
        p "----------------"
        p @commentable
        @comment=@commentable.comments.find_by(id: params[:id])
        @comment.destroy
        redirect_to @commentable
    end


    private
    def comment_params
        params.require(:comment).permit(:body)
    end
end
