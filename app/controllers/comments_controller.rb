class CommentsController < ApplicationController
    # POST /categories/:category_id/comments
    # POST /photos/:photo_id/comments
    def create
        @commentable=Category.find_by(id: params[:category_id]) if params[:category_id]
        @commentable=Photo.find_by(id: params[:photo_id]) if params[:photo_id]
        @comment_new=@commentable.comments.new(comment_params)
        if @comment_new.save
            redirect_to root_path
        else
            console.log("comment not created")
            redirect_to root_path
        end
    end

    # DELETE /categories/:category_id/comments/:id
    # DELETE /photos/:photo_id/comments/:id
    def destroy
        @commentable=Category.find_by(id: params[:category_id]) if params[:category_id]
        @commentable=Photo.find_by(id: params[:photo_id]) if params[:photo_id]
        @comment=@commentable.comments.find_by(id: params[:id])
        @comment.destroy
        redirect_to root_path
    end


    private
    def comment_params
        params.require(:comment).permit(:body)
    end
end
