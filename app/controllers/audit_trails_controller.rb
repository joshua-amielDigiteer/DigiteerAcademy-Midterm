class AuditTrailsController < ApplicationController
    before_action :authorize_user!
    def index
        @pagy, @audit_trails = pagy(AuditTrail.all.order(updated_at: :desc), items:9)
    end

    private
    def authorize_user!
        unless current_user.role_id == 1
          render :file => "public/404.html", alert: "You are not authorized to access this page."
        end
      end
end