class AssignmentsController < ApplicationController
  # load_and_authorize_resource
  # will restrict user if they don't have access 
  before_action :authenticate_user!
  # checks to make sure you are logged in before you can do anything
  def index
    @assignments = Assignment.all
  end

  def show
    @assignment = Assignment.find params[:id]
    @assignment.user = current_user
    @submissions = @assignment.submissions
    @comment = Comment.new

  end

  def new
    @user = current_user
    if @user.admin_status
      @assignment = Assignment.new
      @submissions = Submission.all
    else 
      flash[:notice] = "You are not authorized to add an assignment"
      redirect_to assignments_path
    end  
  end

  # add this code of block to indicate whether user has admin status or just a regular user
  #   @user = current_user
  #   if @user.admin_status 
      # @assignment = Assignment.new
      # @submissions = Submission.all
    # else 
    #   flash[:notice] = "You are not authorized to add an assignment"
    #   redirect_to assignments_path
    # end  

  def create
    @user = current_user
    if @user.admin_status
      @assignment = Assignment.create assignment_params
      @submissions = Submission.all
      @assignment.user = @user

      if @assignment.save
        flash[:notice] = "#{@assignment.name} information successsfully saved."
        redirect_to assignments_path
      else
        flash[:error] = 'Assignment NOT successfully saved.'
        render :new
      end
    else 
      flash[:notice] = "You are not authorized to create an assignment"
      redirect_to assignments_path
    end
  end

  def create_comment
    @assignment = Assignment.find params[:id]
    @comment = @assignment.comments.create comment_params
    redirect_to assignment_path(@assignment)
  end

  def edit
    @assignment = Assignment.find params[:id]
    @submissions = Submission.all
  end

  def update
    @user = current_user
    if @user.admin_status
      @submissions = Submission.all 
      @assignment = Assignment.find params[:id]
      @assignment.user = current_user
      if @assignment.update assignment_params
        flash[:notice] = "#{@assignment.name} information successfully updated."
        redirect_to assignment_path(@assignment)
      else
        flash[:error] = 'Assignment NOT successfully updated.'
        render :new
      end
    else 
      flash[:notice] = "You are not authorized to update an assignment"
      redirect_to assignments_path
    end
  end

  def destroy
    @user = current_user
    if @user.admin_status
      @assignment = Assignment.find params[:id]
      @assignment.delete
      flash[:notice] = "#{@assignment.name}"
      redirect_to assignments_path
    else 
      flash[:notice] = "You are not authorized to update an assignment"
      redirect_to assignments_path
    end
  end

  def destroy_comment
    @comment = Comment.find params[:id]
    @comment.destroy
    redirect_to assignment_path(@comment.commentable)
    # redirect_to @comment.commentable
  end


  private
  def assignment_params
    params.require(:assignment).permit(
      :name,
      :requirements,
      user_id: []
      )
  end
  def comment_params
    params.require(:comment).permit(
      :content
      )
  end
end
