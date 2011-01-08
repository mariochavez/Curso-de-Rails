require File.expand_path(File.dirname(__FILE__) + '/acceptance_helper')

feature "Publicar Nuevas Ofertas De Empleo", %q{
  Para poder llenar una posicion de trabajo
  Como empresa interesada
  Debo poder publicar una oferta
} do

  scenario "En la pagina principal al hacer click en el boton 'Nueva Oferta', se debe de mostrar la forma para llenar la informacion de la oferta" do
    true.should == false
  end
end
