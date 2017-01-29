class UniversitiesController < ApplicationController
	before_action :find_university, only: [:show, :dashboard]
	before_action :find_episode, only: [:show, :dashboard]

	def index
		@universities = University.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 12)
	end

	def show
	end

	def dashboard
	end

	private

	def find_episode
		@episodes = Episode.where(university_id: @university).order("created_at DESC").paginate(:page => params[:page], :per_page => 5)
	end

	def find_university
		if params[:id].nil?
			@university = current_university
		else
			@university = University.find(params[:id])
		end
	end
end
