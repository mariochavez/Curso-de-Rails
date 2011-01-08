class Job < ActiveRecord::Base
  validates_presence_of :title, :message => 'Por favor indique un título'
end
