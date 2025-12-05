class DashboardController < ApplicationController
  before_action :require_student!
  
  def index
    @stats = current_user.dashboard_stats
  end
end
