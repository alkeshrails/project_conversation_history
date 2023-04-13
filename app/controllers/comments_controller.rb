class CommentsController < ApplicationController
  before_action :set_project, only: [:create]

  def create
    @comment = @project.comments.build(comment_params)

    if @comment.save
      redirect_to @project, notice: 'Comment was successfully added.'
    else
      @project.reload
      render 'projects/show'
    end
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def comment_params
    params.require(:comment).permit(:body, :user_id)
  end
end
