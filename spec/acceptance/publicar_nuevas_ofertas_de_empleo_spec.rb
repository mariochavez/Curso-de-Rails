require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature "Publicar Nuevas Ofertas De Empleo", %q{
  Para poder llenar una posicion de trabajo
  Como empresa interesada
  Debo poder publicar una oferta
} do

  scenario "En la pagina principal al hacer click en el boton 'Nueva Oferta', se debe de mostrar la forma para llenar la informacion de la oferta" do
    visit homepage

    #save_and_open_page
    click_link_or_button 'Nueva Oferta'

    page.should have_css 'h1', :text => 'Paso 1: Crear oferta'
    within :css, 'form' do
      page.should have_css '#job_title'
      page.should have_css '#job_category'
      page.should have_css '#job_location'
      page.should have_css '#job_description'
      page.should have_css '#job_contact'
      page.should have_css '#job_company_name'
      page.should have_css '#job_url'
      page.should have_css '#job_email'
    end

  end
end
