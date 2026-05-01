class TestController < ActionController::API
	def show 
		puts "test Controller"
		render json: { status: true, name: 'Ian Nathan Mabborang'}
	end

	def transaction_sample
		error_message = nil
		result = nil

		Db.transaction do
			begin
				login_name = 'jeonsoft'

				if !User.exists?(LoginName: login_name)
					insert_user = Hash.new
					insert_user['LoginName'] = 'jeonsoft'
					User.insert(insert_user)
				else
					raise "User already exist."
				end

				result = { message: 'Transaction completed successfully' }
			rescue StandardError => e
				error_message = e.message
				raise ActiveRecord::Rollback
			# ensure
			# 	Rails.logger.info('transaction_sample ensure block executed')
			end
		end

		if error_message.present?
			render json: { status: false, error: error_message }, status: :unprocessable_entity
		else
			render json: { status: true, data: result }
		end
	end
end
