require "spec_helper"

describe JobMailer do
  describe "published" do
    let(:mail) { JobMailer.published }

    it "renders the headers" do
      mail.subject.should eq("Published")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
