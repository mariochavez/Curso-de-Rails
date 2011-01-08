module HelperMethods
  def have_the_following(*fields)
    fields.each do |field|
      page.should have_css field
    end
  end
end

RSpec.configuration.include HelperMethods, :type => :acceptance
