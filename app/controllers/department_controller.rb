class DepartmentController < ApplicationController
	def list
		render json: { code: 'DEPT1', name: 'Department 1' }
	end
end
