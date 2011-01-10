require 'spec_helper'

describe JobsController do

  let(:job) do
    Factory.build(:job)
  end

  let(:job_with_id) do
    Factory.build(:job, :id => Factory.next(:id).to_i)
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

  describe "PUT 'published'" do
    before(:each) do
      Job.stub!(:"exists?").and_return(true)
      Job.stub!(:find).and_return(job_with_id)
      Job.stub!(:save).and_return(true)
      JobMailer.stub!(:deliver_mail)
      job_with_id.should_receive(:save)
      put :published, :id => 1
    end

    it { should assign_to :job }
    it { JobMailer.should_receive(:deliver_mail).once }
    it { should redirect_to root_url }
    it { should set_the_flash }
  end

  describe "GET 'show'" do
    context "al mostrar un registro que si existe" do
      before(:each) do
        Job.stub!(:"exists?").and_return(true)
        Job.stub!(:find).and_return(job)
        Job.should_receive(:find)
        get :show, :id => 1
      end

      it { should assign_to :job }
      it { should render_template :show }
      it { should respond_with(:success) }
    end

    context "al intentar mostrar un registro que no existe" do
      before(:each) do
        Job.stub!(:"exists?").and_return(false)
        Job.should_not_receive(:find)
        get :show, :id => 1
      end

      it { should_not assign_to :job }
      it { should redirect_to(root_path) }
      it { should set_the_flash }
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
      it { should redirect_to job_path(1) }
      it { should set_the_flash }
    end

    context "al hacer POST con los datos incorrectos" do
      before do
        post :create, :job => { }
      end

      it { should assign_to :job }
      it { should render_template :new }
      it { should_not set_the_flash }
    end
  end
end
