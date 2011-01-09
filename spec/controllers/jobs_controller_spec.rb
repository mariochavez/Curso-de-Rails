require 'spec_helper'

describe JobsController do

  let(:job) do
    Factory.build(:job)
  end

  let(:new_job_hash) do
    { :title => job.title, :description => job.description, :contact => job.contact, :url => job.url, :company_name => job.company_name, :category => job.category, :email => job.email, :location => job.location }
  end

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end

  describe "POST 'create'" do
    context "al hacer POST con los datos correctos" do
      before(:each) do 
        Job.stub!(:save).and_return(true)
        Job.stub!(:to_param).and_return(1)
        post :create, :job => new_job_hash
      end

      it { should assign_to :job }
      it { should redirect_to jobs_path(1) }
      it { should set_the_flash }
    end

    context "al hacer POST con los datos incorrectos" do
      #before do
      #  Job.stub!(:save).and_return(false)
      #  post :create, :job => { }
      #end

      #it { should assign_to :job }
      #it { should render_template :new }
      #it { should_not set_the_flash }
    end
  end
end
