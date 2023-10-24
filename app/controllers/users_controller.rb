class UsersController<ApplicationController
    before_action :authorize_user!
   def index
     @users = User.all
   end

   def authorize_user!
    unless current_user.role_id == 1
        render :file => "public/404.html", alert: "You are not authorized to access this page."
    end
  end
end