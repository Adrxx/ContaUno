module C4
  class GroupsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_group, only: [:show, :edit, :update, :destroy]

    layout 'c4/admin'

    def index
      @groups = Group.all
    end

    def new
      @group = Group.new
    end

    def edit
    end

    def create
      @group = Group.new(group_params)
      begin
        @unique_code = SecureRandom.urlsafe_base64(4).gsub(/[-_]/, '-' => 1, '_' => 'A').upcase
      end while (not Group.find_by_code(@unique_code).blank?)

      @group.code = @unique_code

      if @group.save
        flash[:success] = "Se han creado un nuevo grupo con el código #{@unique_code}"
        redirect_to main_app.groups_path
      else
        render :new
      end
    end

    def update
      if @group.update(group_params)
        flash[:success] = 'Se han guardado los cambios.'
        redirect_to main_app.groups_path
      else
        render :edit
      end
    end

    def destroy
      flash[:warning] = "Se ha destruído: #{@group.name}"
      @group.destroy
      respond_to do |format|
        format.html { redirect_to main_app.groups_url }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_group
        @group = Group.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def group_params
        params.require(:group).permit(:name)
      end
      
  end
end
