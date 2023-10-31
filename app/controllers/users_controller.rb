class UsersController<ApplicationController
    before_action :authorize_user!
   def index
     @pagy, @users = pagy(User.all.order(updated_at: :desc), items:7)
   end

   def new
     @user = User.new
   end

   def create
     @user = User.new(user_params)
     if @user.save
       redirect_to users_path,
         notice: "<strong>#{@user.email}</strong> was successfully created."
         AuditTrail.save_audit(current_user.id, "Create", "Users", @user.inspect)
     else
       # render :new, status: :unprocessable_entity
       render :new, status: :unprocessable_entity, locals: { errors: @user.errors }
     end
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to users_path,
          notice: "<strong>#{@user.email}</strong> was successfully updated."
          AuditTrail.save_audit(current_user.id, "Edit", "Users", @user.inspect)
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @user = User.find(params[:id])
      if @user.destroy
        redirect_to users_path,
          notice: "<strong>#{@user.email}</strong> was successfully deleted."
          AuditTrail.save_audit(current_user.id, "Delete", "Users", @user.inspect)
      end
    end

   private

   def user_params
     params.require(:user).permit(:first_name,:last_name, :email, :password, :password_confirmation, :role_id, :contact_number, :avatar)
   end
   def authorize_user!
    unless current_user.role_id == 1
        render :file => "public/404.html", alert: "You are not authorized to access this page."
    end
  end
end