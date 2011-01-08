module HelperMethods
  def have_the_following(*fields)
    fields.each do |field|
      page.should have_css field
    end
  end

  def should_have_errors(*messages)
    within(:css, 'form') do
      messages.each { |message| page.should have_content(message) }
    end
  end

end

RSpec.configuration.include HelperMethods, :type => :acceptance
