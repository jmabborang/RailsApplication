class TestController < ActionController::API
	def show 
		render json: { status: true }
	end
end
