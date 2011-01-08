require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature "Publicar Nuevas Ofertas De Empleo", %q{
  Para poder llenar una posicion de trabajo
  Como empresa interesada
  Debo poder publicar una oferta
} do

  scenario "En la pagina principal al hacer click en el boton 'Nueva Oferta', se debe de mostrar la forma para llenar la informacion de la oferta" do
    visit homepage

    click_link_or_button 'Nueva Oferta'

    page.should have_css 'h1', :text => 'Paso 1: Crear oferta'
    within :css, 'form' do
      have_the_following(
        '#job_title',
        '#job_category',
        '#job_location',
        '#job_description',
        '#job_contact',
        '#job_company_name',
        '#job_url',
        '#job_email'
      )
    end

  end

  scenario "Al llenar una oferta y tratar de ver el preview sin datos, debe de mostrar los campos que deben ser llenados" do
    visit new_job

    click_link_or_button 'Paso 2: ver oferta'

    save_and_open_page
    should_have_errors(
      'Por favor indique un título',
      'Por favor seleccione una categoría',
      'Por favor indique la ubicación',
      'Por favor indique una descripción',
      'Por favor indique como recibir contacto por la oferta',
      'Por favor indique su dirección de correo electrónico',
      'Por favor indique el nombre de la compañía'
    )       
  end
end
