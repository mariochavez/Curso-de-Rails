require "spec_helper"

describe JobMailer do
  describe "published" do
    let(:job) { Factory.build(:job, :id => Factory.next(:id).to_i) }
    let(:mail) { JobMailer.published job }

    it "renders the headers" do
      mail.subject.should eq("Empleos TI: #{job.title}")
      mail.to.should eq([job.email])
      mail.from.should eq(["mario@jobs.com"])
    end

    it "renders the body" do
      mail.body.encoded.should =~ /#{job.title}/
    end
  end

end
