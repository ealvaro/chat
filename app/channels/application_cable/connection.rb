module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_user_in_cookie
    end

    private

    def find_user_in_cookie
      if verified_user = User.find_by(id: cookies.signed['user.id'])
        verified_user
      else
        reject_unauthorized_connection
      end
    end
  end
end
