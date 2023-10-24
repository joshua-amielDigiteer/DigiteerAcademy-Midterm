class UsersController<ApplicationController
    before_action :authorize_user!
   def index
     @pagy, @users = pagy(User.all.order(updated_at: :desc), items:7)
   end

   def authorize_user!
    unless current_user.role_id == 1
        render :file => "public/404.html", alert: "You are not authorized to access this page."
    end
  end
end