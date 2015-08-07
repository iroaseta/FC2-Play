class AdminController < ApplicationController
  # You can login admin page !!!
  http_basic_authenticate_with name:  'admin', password: 'fc2play'
  before_action :set_new_user

  def index
    @reports = Record.create_reports
    @weeks = @reports[:weeks]

    @playweek = History.weekly_info_for_analyzer
    @survey_result = Survey.info_for_analyzer
    @bugreports = BugReport.all
  end
end
