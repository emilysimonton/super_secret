class WelcomeController < ApplicationController

def index
  if current_user
    redirect_to polls_path
  else
    render :index
  end
end

end
