require 'rails_helper'
describe CoursesController do

  describe 'GET #index' do
    let!(:course1) {
      Course.create({name: "Course1", description: "this is course1."})
    }
    let!(:course2) {
      Course.create({name: "Course2", description: "this is course2."})
    }
    let!(:course3) {
      Course.create({name: "Course3", description: "this is course3."})
    }
    it 'should not return any courses' do
      get :index
      expect(assigns(:courses)).not_to eq(nil)
      expect(assigns(:courses)).to eq([course1, course2, course3])
    end
    it 'should return all courses' do
      get :index
      expect(assigns(:courses)).not_to eq(nil)
      expect(assigns(:courses).length).to eq(3)
      expect(assigns(:courses)).to include(course1)
      expect(assigns(:courses)).to include(course2)
      expect(assigns(:courses)).to include(course3)
    end
  end
# def index
#   @courses = Course.all
# end
  describe 'GET #new' do
    it 'should initialize a new course' do
      get :new
      expect(assigns(:course).class).to eq Course
      expect(assigns(:course).new_record?).to eq(true)
      expect(assigns(:locations).class).to eq(Location::ActiveRecord_Relation)
      expect(assigns(:locations)).to eq([])
    end
  end
# def new
#   @course = Course.new
#   @locations = Location.all
# end
  describe 'POST #create' do
    let!(:location1) {
      Location.create({
        name: "Charleston", 
        address: "510 Mill St."
        })
    }
    it 'should create a new course' do
      expect {post :create, course: 
        { name: "course name", description: "course description" }
        }.to change(Course, :count).by(1)
      expect(assigns(:course).class).to eq Course
      expect(assigns(:locations).class).to eq(Location::ActiveRecord_Relation) 
      expect(response).to redirect_to courses_path
#tests creating up to if @course.save 
    end
    it 'should not create a new course' do
      expect {post :create, course: {name: '', description: ''}}.to_not change(Course, :count)
      expect(assigns(:course).class).to eq Course
      expect(assigns(:locations).class).to eq(Location::ActiveRecord_Relation) 
      expect(response).to render_template :new
    end
#tests the else in create- validation on name
  end
  describe 'GET #show' do
    let!(:course) { FactoryGirl.create(:course) }
    it 'should show a course object' do
      get :show, id: course#, format: :json

      expect(assigns(:course)).to eq course
      expect(assigns(:locations).length).to eq(0)
      expect(assigns(:locations)).to eq([])
      expect(assigns(:locations).class).to eq(Location::ActiveRecord_Associations_CollectionProxy)
    end    
  end
  # def show
  #   @course = Course.find params[:id]
  #   @locations = @course.locations
  # end
  describe 'GET #edit' do
  let!(:course) { FactoryGirl.create(:course) }
    it 'should allow user to edit a course' do
      get :edit, id: course#, format: :json
      expect(assigns(:course)).to eq course
      expect(assigns(:locations).class).to eq(Location::ActiveRecord_Relation)
      expect(assigns(:locations)).to eq([])
    end
  end
  # def edit
  #   @course = Course.find params[:id]
  #   @locations = Location.all
  # end
  describe 'PATCH #update' do
    let!(:course) { FactoryGirl.create(:course) }
      it 'should update the requested course' do
        course_params = FactoryGirl.attributes_for(:course)
        patch :update, id: course, course: course_params
        expect(assigns(:course)).to eq course
        expect(flash[:notice]).to eq 'Rails information successfully updated.'
        expect(response).to redirect_to course_path(course)
      end
    
      it 'should not update the requested course' do
        course_params = FactoryGirl.attributes_for(:course)
        patch :update, id: course, course: {name: '', description: ''}
        expect(response).not_to redirect_to course_path(course)
        expect(response).to render_template :new
      end
    end
  describe 'DELETE #destroy' do
    let!(:course1) {
      Course.create({name: "Course1", description: "this is course1."})
    }
    it 'should delete the course' do
      course_params = FactoryGirl.attributes_for(:course)
      expect{delete :destroy, id: course1}.to change(Course, :count).by(-1)
      expect(flash[:notice]).to eq 'Course1 was deleted' 
      expect(response).to redirect_to courses_path
    end
  end 
# def destroy
#   @course = Course.find params[:id]
#   @course.delete
#   flash[:notice] = "#{@course.name} was deleted"
#   redirect_to courses_path
# end 
end
