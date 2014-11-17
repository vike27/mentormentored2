class PagesController < ApplicationController

	def home
	end

	def index
		@users = User.all
		@user = User.find(current_user)
	end

	def about
	end

	def faq
	end

end
