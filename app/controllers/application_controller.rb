class ApplicationController < ActionController::API
    def get_user_id
      header = request.headers['Authorization']
      token = header.split(' ').last
      puts "token: #{token}"
      decoded_token = JWT.decode(token, 'default-secret-key', true, algorithm: 'HS256')
      puts"decoded_token: #{decoded_token}"
      user_id = decoded_token[0]['user_id']
      puts"user_id: #{user_id}"
      return user_id
    end
end
  