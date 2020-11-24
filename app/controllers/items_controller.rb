class ItemsController < ApplicationController
  def index
    
  end

  private
  
  def
   params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end
end
