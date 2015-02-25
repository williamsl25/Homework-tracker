class SubmissionsController < ApplicationController
  before_action :set_submission, only: [
    :show,
    :edit,
    :update,
    :destroy,
    :begin,
    :submit,
    :review,
    :complete
  ]

  def index
    @assignment = Assignment.find params[:assignment_id]
    @submissions = @assignment.submissions
    authorize! :read, Submission
  end

  def new
    @assignment = Assignment.find params[:assignment_id]
    @submission = @assignment.submissions.new
    @submission.user = current_user
    
  end

  def create
    @assignment = Assignment.find params[:assignment_id]
    @submission = @assignment.submissions.create submission_params
    @submission.user = current_user
    if @submission.save
      flash[:notice] = "Submission was successfully saved"
      redirect_to assignment_submissions_path(@assignment)
    else
      flash[:error] = "Submission was NOT saved"
      render :new
    end
  end

  def create_comment
    @assignment = Assignment.find params[:assignment_id]
    @submission = @assignment.submissions.find params[:id]
    @comment = @submission.comments.create comment_params
    @comment.user = current_user
    if @comment.save
    @comment.save
      UserMailer.comment_email(current_user, @comment).deliver
      UserMailer.submission_user_comment_email(@submission, @comment).deliver

    redirect_to assignment_submission_path(@assignment, @submission)
    else
      render :new
    end
  end

  def show
    @assignment = Assignment.find params[:assignment_id]
    @submission = Submission.find params[:id]
    @comment = Comment.new
    @comments = @submission.comments
    @links = @submission.links
    authorize! :read, @submission
  end

  def edit
    @assignment = Assignment.find params[:assignment_id]
    @submission = @assignment.submissions.find params[:id]
  end

  def update
    @assignment = Assignment.find params[:assignment_id]
    @submission = @assignment.submissions.find params[:id]
    @submission.user = current_user
    if @submission.update_attributes submission_params
      flash[:notice] = "Submission was successfully updated!"
      redirect_to assignment_submission_path(@assignment, @submission)
    else 
      flash[:error] = "Submission was NOT updated."
      render :edit
    end
  end
  def destroy
    @assignment = Assignment.find params[:assignment_id]
    @submission = @assignment.submissions.find params[:id]
    @submission.user = current_user
    @submission.delete
    flash[:notice] = "Submission successfully deleted"
    redirect_to assignment_path(@assignment)
  end

  def destroy_comment
    @comment = Comment.find params[:id]
    @comment.destroy
    authorize! :destroy_comment, @comment
    redirect_to assignment_submission_path(@comment.commentable.assignment, @comment.commentable)
  end

  def begin
    @assignment = Assignment.find params[:assignment_id]
    @submission = @assignment.submissions.find params[:id] 
    @submission.new!
    redirect_to assignment_submission_path(@assignment, @submission)
  end

  def submit 
    @assignment = Assignment.find params[:assignment_id]
    @submission = @assignment.submissions.find params[:id]  
    @submission.submit!
    redirect_to assignment_submission_path(@assignment, @submission)
  end

  def review
    @assignment = Assignment.find params[:assignment_id]
    @submission = @assignment.submissions.find params[:id]   
    @submission.review!
    redirect_to assignment_submission_path(@assignment, @submission)
  end

  def complete
    @assignment = Assignment.find params[:assignment_id]
    @submission = @assignment.submissions.find params[:id]   
    @submission.complete!
    redirect_to assignment_submission_path(@assignment, @submission)
  end

private
  def submission_params
    params.require(:submission).permit(
      :name,
      :content,
      :workflow,
      :assingment_id,
      :user_id
      )
  end

  def comment_params
    params.require(:comment).permit(
      :content,
      :user_id
      )
  end

  def set_submission
    @submission = Submission.find(params[:id])
  end
    
end
