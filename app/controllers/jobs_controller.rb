class JobsController < ApplicationController
  def new
    @job = Job.new
  end

  def create
    @job = Job.new params[:job]

    puts @job.title
    puts @job.errors.inspect
    if @job.save
      redirect_to root_path, :notice => 'La oferta ha sido creada'
    else
      render :new
    end
  end

end
