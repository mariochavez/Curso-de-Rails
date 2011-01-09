require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the JobsHelper. For example:
#
# describe JobsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe JobsHelper do
  describe "hash para el combo de categorias" do
    it "debe de generar hash" do
      helper.category_options.should == { 'Programacion' => 1, 'Diseno web' => 2 }
    end
  end
end
