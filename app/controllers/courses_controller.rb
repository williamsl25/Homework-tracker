class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
    @locations = Location.all
  end

  def create
    @course = Course.create course_params
    @locations = Location.all
    
    if @course.save
      flash[:notice] = "#{@course.name} information successsfully saved."
      redirect_to courses_path
    else
      flash[:error] = 'Course NOT successfully saved.'
      render :new
    end
  end

  def create_comment
    @course = Course.find params[:id]
    @comment = @course.comments.create comment_params
    redirect_to course_path(@course)
  end

  def show
    @course = Course.find params[:id]
    @locations = @course.locations
    @comment = Comment.new
  end

  def edit
    @course = Course.find params[:id]
    @locations = Location.all
  end

  def update
    @locations = Location.all 
    @course = Course.find params[:id]
    if @course.update course_params
      flash[:notice] = "#{@course.name} information successfully updated."
      redirect_to course_path(@course)
    else
      flash[:error] = 'Course NOT successfully updated.'
      render :new
    end
  end

  def destroy
    @course = Course.find params[:id]
    @course.delete
    flash[:notice] = "#{@course.name}"
    redirect_to courses_path
  end

  def destroy_comment
    @comment = Comment.find params[:id]
    @comment.destroy
    redirect_to @comment.commentable
  end

  private 

  def course_params
    params.require(:course).permit(
      :name,
      :description,
      location_ids: []
    )
  end

  def comment_params
    params.require(:comment).permit(
      :content
      )
  end
end
