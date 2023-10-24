class AuditTrailsController < ApplicationController
    before_action :authorize_user!
    def index
        @audit_trails = AuditTrail.all
    end

    private
    def authorize_user!
        unless current_user.role_id == 1
          render :file => "public/404.html", alert: "You are not authorized to access this page."
        end
      end
end