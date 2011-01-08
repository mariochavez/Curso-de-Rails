require 'spec_helper'

describe Job do
  it { should validate_presence_of(:title).with_message('Por favor indique un título') }
  it { should validate_presence_of(:location).with_message('Por favor indique la ubicación') }
  it { should validate_presence_of(:description).with_message('Por favor indique una descripción') }
  it { should validate_presence_of(:contact).with_message('Por favor indique como recibir contacto por la oferta') }
  it { should validate_presence_of(:email).with_message('Por favor indique su dirección de correo electrónico') }
  it { should validate_presence_of(:company_name).with_message('Por favor indique el nombre de la compañía') }
  it { should validate_numericality_of(:category).with_message('Por favor seleccione una categoría') }
  it { should validate_format_of(:email).with('mail@mail.com').with_message('Por favor indique una dirección de correo electrónico válida') }
  it { should validate_format_of(:email).not_with('mail_mail.com').with_message('Por favor indique una dirección de correo electrónico válida') }
  
  it do 
    should_have_db_columns(
    :company_name, :url, :location, :description, :contact, :category, :email)
  end
end
