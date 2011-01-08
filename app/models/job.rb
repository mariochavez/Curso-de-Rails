class Job < ActiveRecord::Base
  validates_presence_of :title, :message => 'Por favor indique un título'
  validates_presence_of :location, :message => 'Por favor indique la ubicación'
  validates_presence_of :description, :message => 'Por favor indique una descripción'
  validates_presence_of :contact, :message => 'Por favor indique como recibir contacto por la oferta'
  validates_presence_of :email, :message => 'Por favor indique su dirección de correo electrónico'
  validates_presence_of :company_name, :message => 'Por favor indique el nombre de la compañía'

  validates_numericality_of :category, :greater_than => 0, :message => 'Por favor seleccione una categoría', :only_integer => true

  validates_format_of :email, :with => /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/, :message => 'Por favor indique una dirección de correo electrónico válida'

end
