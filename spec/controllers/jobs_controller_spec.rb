require 'spec_helper'

describe JobsController do

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end

  describe "POST 'create'" do
    context "al hacer POST con los datos correctos" do
      setup do
        Job.stub!(:save).and_return(true)
        post :create, :job => { }
      end

      it { should assign_to :job }
      it { should redirect_to jobs_path }
      it { should set_the_flash }
    end

    context "al hacer POST con los datos incorrectos" do
      setup do
        Job.stub!(:save).and_return(false)
        post :create, :job => { }
      end

      it { should assign_to :job }
      it { should render_template :new }
      it { should_not set_the_flash }
    end
  end
end
