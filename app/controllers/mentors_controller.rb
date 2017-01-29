class MentorsController < ApplicationController
	before_action :authenticate_university!, except: [:show]
	before_filter :require_permission
	before_action :find_university
	before_action :find_mentor, only: [:show, :edit, :update, :destroy]

	def new
		@mentor = @university.mentors.new
	end

	def create
		@mentor = @university.mentors.new(mentor_params)
		if @mentor.save
			redirect_to university_mentor_path(@university, @mentor)
		else
			render 'new'
		end
	end

	def show
		@mentors = Mentor.where(university_id: @university).order("created_at DESC").limit(6).reject { |e| e.id == @mentor.id }
	end

	def edit
	end

	def update
		if @mentor.update mentor_params
			redirect_to university_mentor_path(@university, @mentor), notice: "Mentor was succesfully updated!"
		else
			render 'edit'
		end
	end

	def destroy
		@mentor.destroy
		redirect_to root_path
	end

	private

	def mentor_params
		params.require(:mentor).permit(:title, :description, :mentor_thumbnail, :mp3)
	end

	def find_university
		@university = University.find(params[:university_id])
	end

	def find_mentor
		@mentor = Mentor.find(params[:id])
	end

	def require_permission
		@university = University.find(params[:university_id])
		if current_university != @university
			redirect_to root_path, notice: "Sorry, you're not allowed to view that page"
		end
	end
end
