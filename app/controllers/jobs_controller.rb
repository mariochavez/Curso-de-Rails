class JobsController < ApplicationController
  def new
    @job = Job.new
  end

  def create
    @job = Job.new params[:job]

    if @job.save
      redirect_to job_path(@job), :notice => 'La oferta ha sido creada'
    else
      render :new
    end
  end

  def show
    if Job.exists? params[:id]
      @job = Job.find params[:id] 
      render :show
    else
      redirect_to root_path, :alert => 'Oferta no encontrada'
    end
  end

  def published
    if Job.exists? params[:id]
      @job = Job.find params[:id]

      @job.published = true
      @job.save

      redirect_to root_path, :notice => 'La oferta fue publicada'
    end
  end

end
