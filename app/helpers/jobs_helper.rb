module JobsHelper
  def category_options
    @categories ||= { 'Programacion' => 1, 'Diseno web' => 2 } 
  end
end
