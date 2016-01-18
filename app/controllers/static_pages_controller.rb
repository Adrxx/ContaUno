class StaticPagesController < ApplicationController



  #TAREAS
  def tareas
    @homework_upload = HomeworkUpload.new
  end

  def create_tareas
    @homework_upload = HomeworkUpload.new(homework_upload_params)
    #byebug
    respond_to do |format|
      if @homework_upload.save
        format.html { redirect_to tareas_path(@homework_upload), notice: 'Se ha subido su tarea con éxito.' }
      else
        format.html { render :tareas }
      end
    end
  end

  private

    def homework_upload_params
      params.require(:homework_upload).permit(:code, :name,:email,:homework)
    end

end
