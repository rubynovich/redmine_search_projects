class SearchProjectsController < ApplicationController
  unloadable

  helper :projects

  def index
    q = params[:q] || params[:project_search]

    scope = Project
    scope = scope.active unless params[:closed]
    scope = scope.scoped(:conditions =>   ["(LOWER(#{Project.table_name}.name) LIKE ? OR
                                             LOWER(#{Project.table_name}.description) LIKE ?)",
                                                                  "%" + q.downcase + "%",
                                                                  "%" + q.downcase + "%"] ) unless q.blank?

    @projects = scope.visible.order('lft').all

    respond_to do |format|
      format.html { render :template => "projects/index"}
      format.js
    end
  end
end
