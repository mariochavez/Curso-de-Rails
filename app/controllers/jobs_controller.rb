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
    @job = Job.find params[:id] 
  end

end
