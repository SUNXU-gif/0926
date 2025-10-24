class SessionsController < ApplicationController
  def destroy
    redirect_to cookings_path
  end
end
