class ApplicationController < ActionController::Base

  def current_user
    session.id
  end
end
