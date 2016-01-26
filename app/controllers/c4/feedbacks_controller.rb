module C4
  class FeedbacksController < ApplicationController
    before_action :authenticate_user!
    before_action :set_params, only: [:show, :create]
    #before_action :set_hw, only: [:show, :create]

    layout 'c4/admin'


    def show
      @feedback = Feedback.new
    end    

    def create
      #byebug
      @feedback = Feedback.new(params[:feedback])
      @feedback.request = request
      @feedback.send_to = @homework.email
      @feedback.sent_by = current_user.email

      if @feedback.deliver
        flash[:success] = 'Se ha enviado correctamente su retroalimentación.'
        redirect_to main_app.groups_url
      else
        render :show
      end
    end



    private
      # Use callbacks to share common setup or constraints between actions.
      def set_params
        @group = Group.find(params[:group_id])
        @homework = HomeworkUpload.find(params[:format]) 

        #byebug
        if @group.teacher_id != current_user.id
          redirect_to main_app.groups_url
        end
      end



      # Never trust parameters from the scary internet, only allow the white list through.
      def group_params
        params.require(:group).permit(:name)
      end
      
  end
end
