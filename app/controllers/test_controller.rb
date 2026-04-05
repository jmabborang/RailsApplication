class TestController < ActionController::API
	def show 
		puts "test Controller"
		render json: { status: true, name: 'Ian Nathan Mabborang'}
	end
end
