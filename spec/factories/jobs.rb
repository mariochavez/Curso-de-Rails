Factory.define :job do |j|
  j.id
  j.title "Desarrollador de Rails"
  j.category 1
  j.location "Tijuana, Mexico"
  j.description "Ingeniero con experiencia en Ruby On Rails"
  j.contact "Enviar CV a mario@jobs.com"
  j.company_name "Decisiones Inteligentes"
  j.email "mario@jobs.com"
end

Factory.sequence :id do |s|
  "#{s}"
end
