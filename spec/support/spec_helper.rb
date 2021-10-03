module SpecHelper   
  
    def log_in(user)
        post "/sessions", params: { session: {first_name: user.first_name, last_name: user.last_name, email: user.email, password: "password", password_confirmation:"password" } }
    end

    def log_out
        session.delete(:session_id)
    end
  
    def current_user
      User.find(session[:user_id])
    end
  end
  